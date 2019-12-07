import 'core-js/features/object/assign'
import 'core-js/features/array/find'
import 'core-js/features/array/from'
import 'core-js/features/promise'
import React from 'react'
import { hydrate } from 'react-dom'
import { BrowserRouter } from 'react-router-dom'
import { loadableReady } from '@loadable/component'
import 'lazysizes'
import App from './app'

loadableReady(() => hydrate(
  <BrowserRouter>
    <App />
  </BrowserRouter>,
  document.getElementById('app')
))

if (module.hot) { module.hot.accept() }
