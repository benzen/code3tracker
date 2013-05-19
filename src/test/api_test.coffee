# db = require("../../build/db")
mongoose = require("mongoose")
Issue = require("../../build/issue").Issue

exports.setUp = (callback) ->
  # connect to a test database and drop all the greetees from it
  mongoose.connect('mongodb://tracker:tracker@localhost/tracker_db',)

  Issue.remove({}, (err)->
    callback()
  )

exports.tearDown = (callback) ->
  mongoose.disconnect()
  callback()


exports.testIssueCreation = (test)->
  i = new Issue;
  i.name = "une belle erreur"
  test.equal i.name, "une belle erreur", "il manque rien"
  test.done();

exports.testIssueCreation2 = (test)->
  i = new Issue(
    name:"Issues can be saved"
  )

  i.save( (err,issue)->
    Issue.count({},(err,count)->
      console.log "heyyyy#{count}"
      test.equal 1, count
      test.done()
    )
  )




