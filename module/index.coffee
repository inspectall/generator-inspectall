_              = require("underscore")
path           = require("path")
util           = require('util');
yeoman         = require('yeoman-generator');
InspectallBase = require("../inspectall_base")


class ModuleGenerator extends InspectallBase
  constructor: ->
    super

    @argument "actions",
      desc: "Actions within the module"
      banner: "actions such as List Show Edit New"
      required: false
      defaults: []
      type: Array

  ## all examples use 'folders' as @name
  init: ->
    ## ie: folders
    @moduleFileName = @_.str.underscored(@name)

    ## ie: apps/folders
    moduleRoot = "apps/" + @moduleFileName

    ## initially clean it out
    @rmdir(moduleRoot)

    ## reset destination root to our module folder
    @destinationRoot path.join(@destinationRoot(), moduleRoot)

  createModuleApp: ->
    ## ie: FoldersApp
    @moduleAppName = @_.classify(@moduleFileName + "_app")

    ## creates apps/folders_app.coffee
    @template "module.coffee", @moduleFileName + "_app.coffee"

  createActions: ->
    ## add name as the first argument
    @actions.unshift(@name)

    ## invoke the inspectall:controller subgenerator
    @invoke "inspectall:controller", args: @actions

module.exports = ModuleGenerator