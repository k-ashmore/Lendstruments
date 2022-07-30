const { environment } = require('@rails/webpacker')

module.exports = environment

// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');
