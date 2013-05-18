require("./issue")
init = (app) ->
  app.get '/', (req, res)->
    res.send 'hello world'
