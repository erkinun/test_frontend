import Koa from '@uswitch/koa-core/koa'
import prefix from './utils/get-path-prefix'
import { isDev } from './server/helpers/env'

/* Koa libraries */
import timeout, { shortCircuit } from '@uswitch/koa-timeout'
import errors from './server/koa/sentry'

import serve from '@uswitch/koa-core/koa-static'
import Router from '@uswitch/koa-core/koa-router'
import helmet from '@uswitch/koa-core/koa-helmet'
import cookie from '@uswitch/koa-core/koa-cookie'
import compose from '@uswitch/koa-core/koa-compose'
import requestId from '@uswitch/koa-core/koa-requestid'
import bodyParser from '@uswitch/koa-core/koa-bodyparser'

/* Middlewares */
import ssi from './server/handlers/handle-ssi'
import assets from './server/handlers/handle-assets'
import render from './server/handlers/handle-render'
import markup from './server/handlers/handle-markup'
import state from './server/handlers/handle-initial-state'
import error from './server/handlers/handle-error'
import { zipkin } from './server/koa/zipkin'

/* Loggers */
import signalConfig from '../__config__/signal.production.json'
import Logger from '@uswitch/koa-signal'
import meters from './meters'

import accessLogConfig from './server/helpers/access-log'
import access, { eventAccess } from '@uswitch/koa-access'
import tracer, { eventTrace, eventError } from '@uswitch/koa-tracer'

/* Template defaults */
import icons from 'ustyle/dist/icons.svg'

import Routes from './routes'

const routes = Routes()
const app = new Koa()
const logger = new Logger(isDev ? {} : signalConfig)

const coreRouter = new Router()

errors.install()

coreRouter.use(compose([ helmet({ hsts: false }), cookie(), requestId(), zipkin, bodyParser() ]))
coreRouter.use(access(accessLogConfig))

coreRouter.get('/icons.svg', ctx => {
  ctx.set('Content-Type', 'image/svg+xml')
  ctx.set('Cache-Control', 'max-age=864000')
  ctx.body = icons
})

routes.forEach((route) => {
  coreRouter.get(route.path, ...shortCircuit(assets, state, markup, render('default'), ssi))
  coreRouter.get(route.path, ctx => (ctx.body = ctx.template))
})
coreRouter.get('*', ctx => (ctx.status = 404))
coreRouter.prefix(prefix())

app.use(serve(process.env.RAZZLE_PUBLIC_DIR))

if (isDev) {
  import(
    /* webpackMode: "eager" */ './server/koa/seo-checker'
  ).then(SEOChecker => app.use(SEOChecker.default))
}

app.use(compose([meters.middleware, tracer(), error(), timeout(60000)]))

app.on(eventError, ({ ctx, original }) => logger.error(ctx, original))
app.on(eventError, () => meters.koaErrorsPerSecond.mark(1))
app.on(eventError, errors.capture)

app.on(eventTrace, ({ ctx, key, trace }) => logger.trace({ ...ctx, ...trace, scope: key }))
app.on(eventAccess, (ctx, extra) => meters.automark({ ...ctx, ...extra }))
app.on(eventAccess, logger.access)

app.use(compose([coreRouter.routes(), coreRouter.allowedMethods()]))

export default app.callback()
