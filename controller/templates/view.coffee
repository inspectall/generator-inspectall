@<%= appName %>.module "<%= moduleAppName %>.<%= action %>", (<%= action %>, App, Backbone, Marionette, $, _) ->

  class <%= action %>.Layout extends App.Views.LayoutView
    template: "<%= templatePath %>"
