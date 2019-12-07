const bindMods = require('./.razzle.modifications.js')

const autoprefixer = require('autoprefixer')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const { BundleAnalyzerPlugin } = require('webpack-bundle-analyzer')
const LoadableWebpackPlugin = require('@loadable/webpack-plugin')
const path = require('path')
const { SassHelpers } = require('ustyle')

module.exports = (base, { target, dev }, webpack) => {
  const config = Object.assign({}, base)
  const { addAlias, addExclude, addPlugin, addRule, modifyRule } = bindMods(config)

  const isServer = target !== 'web'

  const styleLoaders = {
    sass: { loader: 'sass-loader', options: { includePaths: [ './node_modules/ustyle/vendor/assets/stylesheets' ], functions: SassHelpers } },
    css: { loader: 'css-loader',  options: { modules: false, sourceMap: true, minimize: true } },
    postCss: {
      loader: 'postcss-loader',
      options: {
        ident: 'postcss',
        plugins: () => [
          require('autoprefixer')(),
          require('cssnano')({ zindex: false })
        ]
      }
    }
  }

  addAlias({ 'lodash-es': 'lodash' })
  addExclude(/\.ejs$/, /\.svg$/, /\.gql$/)
  addRule({ test: /\.ejs$/, loader: 'ejs-compiled-loader' })
  addRule({ test: /\.gql$/, exclude: /node_modules/, loader: 'graphql-tag/loader'})
  addRule({ test: /\.svg$/, loader: 'raw-loader' })
  addRule({
    test: /.scss$/,
    use: (() => {
      if (isServer) return [ styleLoaders.css, styleLoaders.postCss, styleLoaders.sass ]
      if (dev) return ['style-loader', styleLoaders.css, styleLoaders.postCss, styleLoaders.sass ]

      return [
        MiniCssExtractPlugin.loader,
        { loader: 'css-loader', options: { importLoaders: 1 } }, styleLoaders.postCss, styleLoaders.sass
      ]
    })()
  })

  modifyRule("performance", {
    maxEntrypointSize: 1512000,
    maxAssetSize: 1512000
  })

  !isServer && config.plugins.push(new LoadableWebpackPlugin({ outputAsset: false, writeToDisk: { filename: path.resolve(__dirname, 'build') } }))
  
  !isServer && modifyRule("optimization", {
    splitChunks: {
      cacheGroups: {
        vendor: {
          test: /[\\/]node_modules[\\/]/i,
          name: 'vendor',
          chunks: 'all'
        }
      },
    },
  })

  !isServer && !dev && config.plugins.push(new MiniCssExtractPlugin({ filename: 'static/css/[name].[contenthash:8].css'} ))
  !!process.env.PUBLIC_PATH && (config.output.publicPath = process.env.PUBLIC_PATH)
  !!process.env.ANALYZE && !isServer && config.plugins.push(new BundleAnalyzerPlugin({ openAnalyzer: true, analyzerPort: 8001  }))

  return config
}
