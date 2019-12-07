---
to: src/redux/<%= h.kebabCase(name) %>-actions.js
---
<%
symbol = h.camelCase(name)
partial = h.capitalise(h.camelCase(name))
-%>
export const SET_<%= h.snakeCase(name).toUpperCase() %> = 'SET_<%= h.snakeCase(name).toUpperCase() %>'
export const set<%= h.capitalise(h.camelCase(name)) %> = (payload) => ({ type: SET_<%= h.snakeCase(name).toUpperCase() %>, payload })
