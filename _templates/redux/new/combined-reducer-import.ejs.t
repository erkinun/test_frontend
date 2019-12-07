---
to: src/redux/reducer.js
inject: true
before: import.*reducer
skip_if: import <%= h.camelCase(name) %>
---
import <%= h.camelCase(name) %> from './<%= h.kebabCase(name) %>-reducer.js'