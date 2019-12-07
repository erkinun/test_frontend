---
to: "<%= (!locals.template || locals.template === 'redux') ? 'src/server/handlers/handle-markup.js' : null %>"
---
import React from 'react'
import { renderToString } from 'react-dom/server'
import { StaticRouter } from 'react-router-dom'
import { ChunkExtractor, ChunkExtractorManager } from '@loadable/server'
import path from 'path'

import App from '../../app'

export default async (ctx, next) => {
  const context = {}
  const helmetContext = {}
  const { url, initialState, error } = ctx

  try {
    const statsFile = path.resolve('build/loadable-stats')
    const extractor = new ChunkExtractor({
      statsFile,
      entrypoints: ['client']
    })
    ctx.markup = renderToString(
      <ChunkExtractorManager extractor={extractor}>
        <StaticRouter location={url} context={context}>
          <App isServer initialState={initialState} helmetContext={helmetContext} />
        </StaticRouter>
      </ChunkExtractorManager>
    )
    ctx.head = helmetContext.helmet
    ctx.scriptTags = extractor.getScriptTags()
    ctx.styleTags = extractor.getStyleTags()
    ctx.linkTags = extractor.getLinkTags()
  } catch (ex) {
    const { config = {}, response = {}, message } = ex
    const { method, url } = config
    const { status } = response

    error({ url, method, status, code: 'EINITIALSTATELOAD', message, original: ex })
  }

  return next()
}
