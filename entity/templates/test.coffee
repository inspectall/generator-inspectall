describe "<%= modelName %> Entity", ->
  beforeEach ->
    @<%= modelName.toLowerCase()%> = App.request "new:<%= modelName.toLowerCase() %>:entity", {}