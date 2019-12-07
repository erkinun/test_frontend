import { compile } from '../helpers/ssi'
const locations = {
  '^/widgets': 'https://www.uswitch.com',
  '^/includes': 'https://www.uswitch.com'
}

export default async (ctx, next) => {
  if (ctx.request.get('X-USWITCH-SSI') === 'ON') return next()
  ctx.trace('SSI', { msg: 'Begin SSI' })
  try {
    const content = await compile(locations, ctx.template)
    ctx.template = content
  } catch ({ config = {}, response = {}, request = {}, message }) {
    const { method, url } = config
    const { status } = response
    ctx.error({ url, method, status, code: 'ERENDER', message })
  }
  ctx.trace('SSI', { msg: 'SSI Complete' })
  return next()
}
