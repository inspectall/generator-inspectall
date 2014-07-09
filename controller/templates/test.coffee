describe "<%= action %> <%= moduleAppName %>", ->
  beforeEach ->
    @sandbox.useFakeServer()

    @sandbox.server.mock
      url: "changeme"
      response: Fixtures.get("json.<%= moduleAppName.toLowerCase() %>")

    App.as("admin").enter("/<%= moduleAppName %>").ready (@controller) =>
      @region = App.findRegionByEl "#main"