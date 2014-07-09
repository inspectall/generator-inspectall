util = require('util');
yeoman = require('yeoman-generator');


class ConfigGenerator extends yeoman.generators.Base
  askForConfig: ->
    question = [
      {
        name: "appName"
        message: "What's the client (JS) name of your application?"
      },{
        name: "appPath"
        message: "What's the path to your root backbone folder?"
        default: "app/js/backbone"
      },{
        name: "entitiesPath"
        message: "What's the path to your entities?"
        default: "entities"
      }
    ]

    @prompt question, (answers) =>
      @config.set answers
      @config.save()

module.exports = ConfigGenerator