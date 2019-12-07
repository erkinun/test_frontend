---
to: src/server-meta.js
---
import Koa from '@uswitch/koa-core/koa'
import Router from '@uswitch/koa-core/koa-router'
import meters from './meters'

const app = new Koa()
const metaRouter = new Router()

metaRouter.get('/metrics', (ctx) => (ctx.body = meters.print()))
metaRouter.get(['/status', '/favicon.ico'], ctx => (ctx.body = `Everything's fine`))

app.use(metaRouter.routes())

export default app.callback()
