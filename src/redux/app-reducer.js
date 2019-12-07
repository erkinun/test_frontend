import sw from '../utils/switch'
import * as act from './app-actions'

export default (state = {}, { type, payload }) => sw({
  [act.SET_ENV]: (env) => ({ env, ...state }),
  default: state
})(type, payload)
