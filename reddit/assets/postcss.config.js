const DEBUG = process.env.NODE_ENV !== 'production'

module.exports = {
  plugins: [
    require('postcss-import')(),
    require('postcss-cssnext')({
      features: {
        customProperties: false
      }
    })
  ].concat(DEBUG ? [
    require('postcss-reporter')(),
    require('postcss-browser-reporter')()
  ] : [])
}
