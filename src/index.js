import http from 'http'

import Signal from '@uswitch/koa-signal'
import env, { release } from './server/helpers/env'
import app from './server.js'
import metaApp from './server-meta.js'

const PORT = process.env.PORT || 3000
const META_PORT = process.env.SERVICE_PORT || 3050
const signal = new Signal()
const server = http.createServer(app)
const metaServer = http.createServer(metaApp)

let currentApp = app

server.listen(PORT, () => signal.start(`Server ${release} running: ${env}@${PORT}`))
metaServer.listen(META_PORT, () => signal.start(`Meta server ${release} running: ${env}@${PORT}`))

if (module.hot) {
  signal.info('Server-side HMR Enabled!')

  module.hot.accept('./server', () => {
    signal.info('HMR Reloading `./server`...')

    server.removeListener('request', currentApp)
    const newApp = require('./server').default

    server.on('request', newApp)
    currentApp = newApp
  })
}
