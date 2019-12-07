import env, { isDev, isProd, release } from '../helpers/env'
import config from '../../../__config__/env.json'
import render from '../helpers/templates'

const { sentryDSN } = config

export default (template = 'default') => async (ctx, next) => {
  const { trace, error } = ctx
  trace('RENDER', { msg: 'Begin Rendering' })
  try {
    ctx.template = render[template]({ ...ctx, process, crossorigin: isDev, isProd, release, env, sentryDSN })

    trace('RENDER', { msg: 'Render Complete' })
    return next()
  } catch (ex) {
    const { config = {}, response = {}, message } = ex
    const { method, url } = config
    const { status } = response

    error({ url, method, status, code: 'ERENDER', message, original: ex })

    return (ctx.status = 500)
  }
}
