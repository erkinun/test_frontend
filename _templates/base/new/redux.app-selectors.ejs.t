---
to: "<%= (!locals.template || locals.template === 'redux') ? 'src/redux/app-selectors.js' : null %>"
---
const app = (s = {}) => s.app || {}
export const env = (s = {}) => app(s).env || 'development'
