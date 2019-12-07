---
to: src/client.js
---
import 'core-js/features/object/assign'
import 'core-js/features/array/find'
import 'core-js/features/array/from'
import 'core-js/features/promise'
import React from 'react'
import { hydrate } from 'react-dom'
import { BrowserRouter } from 'react-router-dom'
import { loadableReady } from '@loadable/component'
import 'lazysizes'
<% if (locals.template === 'apollo') { -%>
import env from './server/helpers/env'
import fetch from 'unfetch'
import { client as uri } from '../__config__/urls.json'
import appFactory from './app'
import { makeClient } from './apollo/client'

const clientUrl = uri[env]
const client = makeClient({ isServer: false, uri: clientUrl, fetch })
const App = appFactory({ client })
<% } else { -%>
import App from './app'
<% } -%>

loadableReady(() => hydrate(
  <BrowserRouter>
    <App />
  </BrowserRouter>,
  document.getElementById('app')
))

if (module.hot) { module.hot.accept() }
