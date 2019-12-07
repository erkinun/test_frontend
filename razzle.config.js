const LoadableBabelPlugin = require('@loadable/babel-plugin')
const babelPresetRazzle = require('razzle/babel')

module.exports = {
  modify: require('./.razzle.config.js'),
  modifyBabelOptions: () => ({
    babelrc: false,
    presets: [babelPresetRazzle],
    plugins: [
      LoadableBabelPlugin,
      ["transform-imports", {
        "@uswitch/ustyle-react": {
          "transform": "@uswitch/ustyle-react/dist/components/${member}",
          "preventFullImport": true
        }
      }]
    ]
  })
}
