@<%= appName %>.module "<%= moduleAppName %>.<%= action %>", (<%= action %>, App, Backbone, Marionette, $, _) ->

  class <%= action %>.Controller extends App.Controllers.Application

    initialize: ->