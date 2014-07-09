@<%= appName %>.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.<%= modelName %> extends Entities.Model

  <% if(answers.collection){ %>
  class Entities.<%= collectionName %> extends Entities.Collection
    model: Entities.<%= modelName %>
  <% } %>