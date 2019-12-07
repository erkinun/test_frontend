---
to: "<%= locals.template === 'apollo' ? 'src/server/handlers/handle-state-markup.js' : null %>"
---
import React from 'react'
import { StaticRouter } from 'react-router-dom'
import { ChunkExtractor, ChunkExtractorManager } from '@loadable/server'
import path from 'path'
import { makeClient } from '../../apollo/client'
import cachingWrapperFactory from '../helpers/caching-wrapper'
import { renderToStringWithData } from 'react-apollo'
import appFactory from '../../app'
import env from '../helpers/env'
import { server } from '../../../__config__/urls.json'
import { traceFetch } from '../koa/zipkin'

const serverUrl = server[env]
const cachingWrapper = cachingWrapperFactory()

export default async (ctx, next) => {
  if (ctx.state.timeout) return

  const { trace, error, url, headers } = ctx
  const helmetContext = {}
  const context = {}

  const fetch = (uri, options) => {
    options.headers.cookie = headers.cookie
    options.headers['User-Agent'] = headers['user-agent']
    return traceFetch('graphql', uri, options)
  }

  trace('INITIAL_STATE_LOAD', 'loadStarted')
  try {
    const client = makeClient({ isServer: true, uri: serverUrl, fetch, headers, cachingWrapper })
    const App = appFactory({ client, helmetContext })
    const statsFile = path.resolve('build/loadable-stats')
    const extractor = new ChunkExtractor({
      statsFile,
      entrypoints: ['client']
    })

    ctx.markup = await renderToStringWithData(
      <ChunkExtractorManager extractor={extractor}>
        <StaticRouter location={url} context={context}>
          <App />
        </StaticRouter>
      </ChunkExtractorManager>
    )
    ctx.head = helmetContext.helmet
    ctx.scriptTags = extractor.getScriptTags()
    ctx.styleTags = extractor.getStyleTags()
    ctx.linkTags = extractor.getLinkTags()
    ctx.initialState = client.cache.extract()
  } catch (ex) {
    const { config = {}, response = {}, message } = ex
    const { method, url } = config
    const { status } = response

    error({ url, method, status, code: 'EINITIALSTATELOAD', message, original: ex })
  }

  trace('INITIAL_STATE_LOAD', 'loadFinished')
  return next()
}
