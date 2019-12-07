---
to: src/redux/<%= h.kebabCase(name) %>-reducer.js
---
<%
file = h.kebabCase(name)
symbol = h.camelCase(name)
partial = h.capitalise(h.camelCase(name))
-%>
import sw from '../utils/switch'
import * as act from './<%= file %>-actions'

export default (state = <%= locals.defaultState || '{}' %>, { type, payload }) => sw({
  [act.SET_<%= h.snakeCase(name).toUpperCase() %>]: (payload) => ({ ...state, ...payload }),
  default: state
})(type, payload)
