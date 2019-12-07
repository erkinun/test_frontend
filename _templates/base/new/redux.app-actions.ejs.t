---
to: "<%= (!locals.template || locals.template === 'redux') ? 'src/redux/app-actions.js' : null %>"
---
export const SET_ENV = 'SET_ENV'
export const setEnv = (env) => ({ type: SET_ENV, payload: env })
