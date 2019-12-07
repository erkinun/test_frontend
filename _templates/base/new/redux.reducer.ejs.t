---
to: "<%= (!locals.template || locals.template === 'redux') ? 'src/redux/reducer.js' : null %>"
---
import { combineReducers } from 'redux'
import app from './app-reducer'

export default combineReducers({
  app
})
