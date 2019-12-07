import * as Sentry from '@sentry/node'
import { isDev, environment, release } from '../helpers/env'
import config from '../../../__config__/env.json'
import { pick, omit } from '../../utils/obj'

const { sentryDSN } = config

const install = () => {
  if (isDev || !sentryDSN) return
  Sentry.init({
    dsn: sentryDSN,
    environment,
    release,
  })
}

const capture = ({ ctx, original }) => {
  if (isDev || !sentryDSN) return

  Sentry.withScope((scope) => {
    const { id, trace } = ctx.state
    const { usca, usci, uscd } = ctx.cookie || {}
    const { headers, request } = ctx

    scope.setUser({id: usca || usci || uscd || '???', usca, usci, uscd})

    scope.setTag('requestId', id)
    scope.setTag('release', release)
    scope.setTag('environment', environment)
    scope.setTag('runtime', 'server')
    scope.setTag(
      'url',
      request.href ? request.href.split('?')[0] : 'No URL attached'
    )
    scope.setExtra('browser', headers['user-agent'])
    scope.setExtra('query', request.queryString)
    scope.setExtra('method', request.method)

    Object
      .entries(trace)
      .reduce((acc, [ category, { traces } ]) => [
        ...acc,
        ...traces.map(({ msg }) => ({ category, message: msg }))
      ], [])
      .forEach(crumb => Sentry.addBreadcrumb(crumb))

    Sentry.captureException(original)
  })
}

export default { install, capture }
