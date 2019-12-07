---
to: "<%= (!locals.template || locals.template === 'redux') ? '_templates/redux/new/combined-reducer-export.ejs.t' : null %>"
---
---
to: src/redux/reducer.js
inject: true
after: export default combineReducers
skip_if: import <%%= h.camelCase(name) %%>
---
  <%%= h.camelCase(name) %%>,