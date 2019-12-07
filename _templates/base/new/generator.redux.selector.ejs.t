---
to: "<%= (!locals.template || locals.template === 'redux') ? '_templates/redux/new/selector.ejs.t' : null %>"
---
---
to: src/redux/<%%= h.kebabCase(name) %%>-selectors.js
---
<%%
symbol = h.camelCase(name)
partial = h.capitalise(h.camelCase(name))
-%%>
const <%%= symbol %%> = (s = {}) => s.<%%= symbol %%> || <%%= locals.defaultState || '{}' %%>

export const get<%%= partial %%> = (s = {}) => <%%= symbol %%>(s)
