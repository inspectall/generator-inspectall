_              = require("underscore")
path           = require("path")
util           = require('util');
yeoman         = require('yeoman-generator');
InspectallBase = require("../inspectall_base")


class EntityGenerator extends InspectallBase
  prompting: ->
    done = @async()

    @modelName = @_.classify(@name)
    @collectionName = @_.classify(@name) + "sCollection"

    questions = [
      {
        type: "confirm"
        name: "url"
        message: "Does this model interact a database?"
      },{
        type: "confirm"
        name: "collection"
        message: "Create corresponding collection?: '#{@collectionName}'"
      },{
        type: "confirm"
        name: "handlers"
        message: "Create default request handlers?"
      }
    ]

    @prompt questions, (answers) =>
      @answers = answers

      ## set the urlRoot
      ## ie: Routes.folders_path()
      @url = "Routes.#{@modelName.toLowerCase()}s_path()" if answers.url

      done()

  writing: ->
    ## start with the entitiesPath
    dest = [@entitiesPath]

    ## add abstract folder if this is an abstract model
    dest.push("abstract") if not @answers.url

    ## add file name
    dest.push(@name.toLowerCase() + ".coffee")

    @template "entity.coffee", dest.join("/")

module.exports = EntityGenerator
