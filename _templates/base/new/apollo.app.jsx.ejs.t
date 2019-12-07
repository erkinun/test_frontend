---
to: "<%= (locals.template === 'apollo') ? 'src/app.jsx' : null %>"
---
import React from 'react'
import { ApolloProvider } from 'react-apollo'
import { Route, Switch } from 'react-router-dom'
import { Helmet, HelmetProvider } from 'react-helmet-async'

import prefix from './utils/get-path-prefix'
import Routes from './routes'
const routes = Routes()

export default ({client, helmetContext = {}}) => () => {
  return (
    <HelmetProvider context={helmetContext}>
      <Helmet />
      <ApolloProvider client={client}>
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
      </ApolloProvider>
    </HelmetProvider>
  )
}
