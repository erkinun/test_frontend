import React from 'react'

import reducer from './redux/reducer'
import thunk from 'redux-thunk'
import { Provider } from 'react-redux'
import { createStore, applyMiddleware } from 'redux'

import { Route, Switch } from 'react-router-dom'
import { HelmetProvider } from 'react-helmet-async'

import { composeWithDevTools } from 'redux-devtools-extension'

import prefix from './utils/get-path-prefix'
import Routes from './routes'
const routes = Routes()

export default ({isServer, initialState, helmetContext = {}}) => {
  const state = isServer
    ? initialState
    : window.__initialState__

  const store = createStore(reducer, state, composeWithDevTools(applyMiddleware(thunk)))

  return (
    <HelmetProvider context={helmetContext}>
      <Provider store={store}>
        <Switch>
          {routes.map(({ path, exact, component: C, ...rest }) => (
            <Route
              key={path}
              path={`${prefix()}${path}`}
              exact={exact}
              render={(props) => (
                <C {...props} {...rest} />
              )}
            />
          ))}
        </Switch>
      </Provider>
    </HelmetProvider>
  )
}
