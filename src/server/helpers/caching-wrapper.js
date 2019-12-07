import Cache from 'node-cache'
import crypto from 'crypto'
import { Observable } from 'apollo-link'
import * as Sentry from '@sentry/node'

const CACHE_TIME_TO_LIVE = 300 // seconds
const CACHE_CHECK_FOR_EXPIRED = 5 // seconds

export const buildKey = (args) => {
  const hash = crypto.createHash('sha256')

  hash.update(JSON.stringify(args))
  return hash.digest('hex')
}

const updateCache = (resolver, cache, operation) => {
  const key = buildKey(operation)
  const returnObservable = new Observable((o) => {
    resolver.request(operation).subscribe(response => {
      if (!response.errors) {
        cache.set(key, {
          response,
          operation,
          shouldRefresh: false
        })
      }
      o.next(response)
      o.complete()
    })
  })

  return returnObservable
}

const fetchAndUpdate = (resolver, cache, operation) => {
  const key = buildKey(operation)
  let cacheValue

  try {
    cacheValue = cache.get(key)
  } catch (err) {
    Sentry.captureException(err)
  }

  if (cacheValue) {
    if (cacheValue.shouldRefresh) return Observable.of(cacheValue.response)
    cache.set(key, { ...cacheValue, shouldRefresh: true })
    return Observable.of(cacheValue.response)
  }
  return updateCache(resolver, cache, operation)
}

export default () => {
  const cache = new Cache({
    stdTTL: CACHE_TIME_TO_LIVE,
    checkperiod: CACHE_CHECK_FOR_EXPIRED,
    deleteOnExpire: false
  })
  return (resolver) => {
    cache.on('expired', (key, { args, shouldRefresh }) => {
      setImmediate(() => {
        if (shouldRefresh && args) {
          updateCache(resolver, cache, args)
        } else {
          cache.del(key)
        }
      })
    })

    return (operation) => fetchAndUpdate(resolver, cache, operation)
  }
}
