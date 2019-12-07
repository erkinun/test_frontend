---
to: "<%= (!locals.template || locals.template === 'redux') ? 'src/redux/app-reducer.js' : null %>"
---
import sw from '../utils/switch'
import * as act from './app-actions'

export default (state = {}, { type, payload }) => sw({
  [act.SET_ENV]: (env) => ({ env, ...state }),
  default: state
})(type, payload)
