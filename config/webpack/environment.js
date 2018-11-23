const {
  environment
} = require('@rails/webpacker')
const erb = require('./loaders/erb')
// const path = require('path')
// const PurgecssPlugin = require('purgecss-webpack-plugin')
// const glob = require('glob-all')

environment.loaders.append('erb', erb)



module.exports = environment