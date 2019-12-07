const { resolve } = require('path')
const { readFileSync } = require('fs')

const capitalise = s => s.slice(0, 1).toUpperCase() + s.slice(1)
const camelCase = str => {
  let s =
      str &&
      str
      .match(/[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+/g)
      .map(x => x.slice(0, 1).toUpperCase() + x.slice(1).toLowerCase())
      .join('')
  return s.slice(0, 1).toLowerCase() + s.slice(1)
}
const snakeCase = str => str &&
      str
      .match(/[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+/g)
      .map(x => x.toLowerCase())
      .join('_')
const kebabCase = str => str &&
      str
      .match(/[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+/g)
      .map(x => x.toLowerCase())
      .join('-')

module.exports = {
  helpers: {
    camelCase, capitalise, snakeCase, kebabCase,
    addReducer: name => {
      const reducerText = readFileSync(resolve(__dirname, 'src/redux/reducer.js'), 'utf-8')
      const reducers = /combineReducers\({(.*?)}\)/.exec(reducerText)[1] || ''
      const newReducers = `combineReducers({ ${camelCase(name)}, ${reducers.trim()} })`
      const newReducerText = reducerText.replace(/combineReducers\(.*?\)/, newReducers)
      
      return `import ${camelCase(name)} from './${kebabCase(name)}-reducer'
${newReducerText}`
    }
  }
}
