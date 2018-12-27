const path = require('path')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const UglifyJsPlugin = require('uglifyjs-webpack-plugin')
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin')
const CleanWebpackPlugin = require('clean-webpack-plugin')
const LiveReloadPlugin = require('webpack-livereload-plugin')

const DEBUG = process.env.NODE_ENV !== 'production'
const SRC = '.'
const DEST = '../priv/static'

module.exports = (env, options) => ({
  optimization: {
    minimizer: [
      new UglifyJsPlugin({ cache: true, parallel: true, sourceMap: DEBUG }),
      new OptimizeCSSAssetsPlugin({
        cssProcessorOptions: {
          map: {
            inline: !DEBUG
          }
        }
      })
    ]
  },
  entry: {
    // JavaScript
    './js/app': `${SRC}/js/app.js`,
    // CSS
    './css/app': `${SRC}/css/app.js`
  },
  output: {
    path: path.resolve(__dirname, DEST),
    filename: '[name].js',
    pathinfo: DEBUG
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      },
      {
        test: /\.s[c|a]ss$/,
        use: [
          'style-loader',
          MiniCssExtractPlugin.loader,
          'css-loader',
          'postcss-loader', 'sass-loader'
        ]
      }
    ]
  },
  plugins: [
    // Delete old files when compiling
    new CleanWebpackPlugin([ DEST ], { allowExternal: true }),

    // Extract to .css
    new MiniCssExtractPlugin({
      filename: '[name].css'
    }),

    // Copying files directly
    new CopyWebpackPlugin([
      { from: `${SRC}/static`, to: '.' }
    ])
  ].concat(DEBUG ? [
    // LiveReload in development
    new LiveReloadPlugin({
      appendScriptTag: true
    })
  ] : []),

  devtool: DEBUG ? 'source-map' : 'hidden-source-map'
})
