_       = require("underscore")
rimraf  = require("rimraf")
path    = require("path")
yeoman  = require('yeoman-generator')

mixins =
  rmdir: (dir) ->
    ## synch removal of directory
    rimraf.sync path.join(@destinationRoot(), dir)

class InspectallBase extends yeoman.generators.NamedBase
  constructor: ->
    super

    @appName      = @config.get("appName") || @appname
    @appPath      = @config.get("appPath")
    @entitiesPath = @config.get("entitiesPath")
    @testPath     = @config.get("testPath")

    @rootPath = @destinationRoot()
    @destinationRoot(path.join(@destinationRoot(), @appPath))

    ## mixin each of the mixin functions
    ## reset their context to our Base instance
    _.each mixins, (fn, key, list) =>
      @[key] = _.bind(fn, @)

module.exports = InspectallBase