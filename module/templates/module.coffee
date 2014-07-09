@<%= appName %>.module "<%= moduleAppName %>", (<%= moduleAppName %>, App, Backbone, Marionette, $, _) ->

  class Router extends App.Routers.Application
    module: <%= moduleAppName %>

    manifest: "<%= moduleFileName %>"

    actions:

  router = new Router