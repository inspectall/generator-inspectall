_              = require("underscore")
path           = require("path")
util           = require('util');
yeoman         = require('yeoman-generator');
InspectallBase = require("../inspectall_base")


class ControllerGenerator extends InspectallBase
  constructor: ->
    super

    @argument "actions",
      desc: "Actions within the module"
      banner: "actions such as List Show Edit New"
      required: true
      defaults: []
      type: Array

  ## all examples use 'folders' as @name
  init: ->
    ## ie: folders
    @moduleFileName = @_.str.underscored(@name)

    ## ie: apps/folders
    moduleRoot = "apps/" + @moduleFileName

    ## reset destination root to our module folder
    @destinationRoot path.join(@destinationRoot(), moduleRoot)

  appendRouterActions: ->
    ## appends the actions directly after 'actions:' in the module app file
    moduleFile = @readFileAsString(@moduleFileName + "_app.coffee")

    ## ie FoldersApp
    @moduleAppName = @_.classify(@moduleFileName + "_app")

    _.each @actions, (action) =>
      moduleFile = moduleFile.replace /(actions\:)/, "$1" + "\n      #{action}: ->"
      @write @moduleFileName + "_app.coffee", moduleFile

  createActions: ->
    ## create the initial controller / view / template
    ## for each action
    _.each @actions, (action) =>
      data = _.extend {}, @, action: @_.classify(action)
      file = action.toLowerCase() + "/" + action.toLowerCase()
      @template "controller.coffee", "#{file}_controller.coffee", data
      @template "view.coffee", "#{file}_view.coffee", data

module.exports = ControllerGenerator