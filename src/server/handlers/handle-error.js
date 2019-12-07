import { isDev } from '../helpers/env.js'

export default () => async (ctx, next) => {
  try {
    await next()
  } catch (ex) {
    ctx.status = 500
    ctx.body = isDev ? ex.stack : 'Internal server error'
    ctx.error ? ctx.error(ex) : console.error(ex)
  }
}
