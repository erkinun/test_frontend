---
to: src/routes.js
---
import loadable from '@loadable/component'
// inject any dependencies as to not import packages on the front end that we don't want to
<% if (!locals.template || locals.template === 'redux') { -%>
export default ({ fetchClient } = {}) => [
  {
    path: '/',
    component: loadable(() => import('./components/main')),
    exact: true,
    reduxActions: async ({ params, query }) => {
      return []
    }
  }
]
<% } -%>
<% if (locals.template === 'apollo') { -%>
export default ({ fetchClient } = {}) => [
  {
    path: '/',
    component: loadable(() => import('./components/main')),
    exact: true
  }
]
<% } -%>
