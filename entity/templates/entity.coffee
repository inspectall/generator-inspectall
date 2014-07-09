@<%= appName %>.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.<%= modelName %> extends Entities.Model
    <%= answers.url ? "db: " + '"api"' : '' %>
    <%= answers.url ? "urlRoot: " + url : '' %>
  <% if(answers.collection){ %>
  class Entities.<%= collectionName %> extends Entities.Collection
    model: Entities.<%= modelName %>
  <% } %>
    <%= answers.url ? "db: " + '"api"' : '' %>
    <%= answers.url ? "url: " + url : '' %>

  <% if (answers.handlers){ %>
  API =
    get<%= modelName %>: (id) ->
      <%= modelName.toLowerCase() %> = new Entities.<%= modelName %> id: id
      <%= modelName.toLowerCase() %>.fetch()
      <%= modelName.toLowerCase() %>

    getNew<%= modelName %>: (attrs) ->
      new Entities.<%= modelName %> attrs
    <% if(answers.collection){ %>
    get<%= modelName %>s: ->
      <%= modelName.toLowerCase() %>s = new Entities.<%= collectionName %>
      <%= modelName.toLowerCase() %>s.fetch
        reset: true
      <%= modelName.toLowerCase() %>s
    <% } %>

  App.reqres.setHandler "<%= modelName.toLowerCase() %>:entity", (id) ->
    API.get<%= modelName %> id

  App.reqres.setHandler "new:<%= modelName.toLowerCase() %>:entity", (attrs = {}) ->
    API.getNew<%= modelName %> attrs
  <% if(answers.collection){ %>
  App.reqres.setHandler "<%= modelName.toLowerCase() %>:entities", ->
    API.get<%= modelName %>s()
  <% } %>
  <% } %>