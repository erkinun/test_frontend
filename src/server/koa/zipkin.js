import { middleware, fetch, Logger, Tracer } from '@uswitch/koa-zipkin'

import { isDev, environment } from '../helpers/env'
import { appName as localName } from '../../../__config__/env.json'
import { zipkin as endpoint } from '../../../__config__/urls.json'

import client from 'node-fetch'


const logger = Logger({ local: isDev, endpoint: endpoint[environment] })
const tracer = Tracer(localName, logger)

export const zipkin = middleware({ tracer })
export const traceFetch = fetch({ local: localName, fetch: client, tracer })
