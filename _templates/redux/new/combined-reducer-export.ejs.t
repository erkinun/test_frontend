---
to: src/redux/reducer.js
inject: true
after: export default combineReducers
skip_if: import <%= h.camelCase(name) %>
---
  <%= h.camelCase(name) %>,