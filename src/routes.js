import loadable from '@loadable/component'
// inject any dependencies as to not import packages on the front end that we don't want to
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
