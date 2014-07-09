@<%= appName %>.module "<%= moduleAppName %>.<%= action %>", (<%= action %>, App, Backbone, Marionette, $, _) ->

  class <%= action %>.Controller extends App.Controllers.Application

    initialize: ->
      @layout = @getLayoutView()

      @listenTo @layout, "show", =>

      @show @layout

    getLayoutView: ->
      new <%= action %>.Layout