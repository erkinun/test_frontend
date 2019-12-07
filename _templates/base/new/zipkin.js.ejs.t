---
to: "src/server/koa/zipkin.js"
---
import { middleware, fetch, Logger, Tracer } from '@uswitch/koa-zipkin'

import { isDev, environment } from '../helpers/env'
import { appName as localName } from '../../../__config__/env.json'
import { zipkin as endpoint } from '../../../__config__/urls.json'

<% if (!locals.http || (locals.http !== 'axios' && locals.http !== 'axios+cache')) { -%>
import client from 'node-fetch'
<% } -%>
<% if (locals.http === 'axios' || locals.http === 'axios+cache') { -%>
import axios from 'axios'
<% } -%>
<% if (locals.http === 'axios+cache') { -%>
import cache from 'axios-cache-adapter'

const { adapter } = cache.setupCache({ maxAge: 1000 })
const axiosClient = axios.create({ adapter })
<% } -%>

<% if (locals.http === 'axios+cache') { -%>
axiosClient.interceptors.response.use(
  (res) => {
    res.headers['X-Cache-Enabled'] = true
    return res
  },
  Promise.reject
)
<% } -%>

const logger = Logger({ local: isDev, endpoint: endpoint[environment] })
const tracer = Tracer(localName, logger)

export const zipkin = middleware({ tracer })
<% if (locals.http === 'axios' || locals.http === 'axios+cache') { -%>
export const traceFetch = fetch({ local: localName, fetch: axiosClient, tracer })
<% } -%>
<% if (!locals.http || (locals.http !== 'axios' && locals.http !== 'axios+cache')) { -%>
export const traceFetch = fetch({ local: localName, fetch: client, tracer })
<% } -%>
