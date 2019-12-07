import env from '../helpers/env'
import thunk from 'redux-thunk'
import { createStore, applyMiddleware } from 'redux'
import { setEnv } from '../../redux/app-actions'
import reducer from '../../redux/reducer'
import Routes from '../../routes'
import { matchPath } from 'react-router-dom'

const routes = Routes()

export default async (ctx, next) => {
  if (ctx.state.timeout) return

  const { trace, error } = ctx
  const store = createStore(reducer, {}, applyMiddleware(thunk))
  const activeRoute = routes.find(route => matchPath(ctx.path, route))

  trace('INITIAL_STATE_LOAD', 'loadStarted')
  try {
    const actions = activeRoute.reduxActions ? await activeRoute.reduxActions(ctx) : []
    await Promise.all(actions.map(store.dispatch))
    store.dispatch(setEnv(env))
  } catch (ex) {
    const { config = {}, response = {}, message } = ex
    const { method, url } = config
    const { status } = response

    error({ url, method, status, code: 'EINITIALSTATELOAD', message, original: ex })
  }

  ctx.initialState = store.getState()
  trace('INITIAL_STATE_LOAD', 'loadFinished')
  return next()
}
