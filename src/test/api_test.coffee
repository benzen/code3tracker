issue = require("../../build/issue")


exports.testIssueCreation = (test)->
  i = new issue.Issue;
  i.name="une belle erreur"
  test.equal i.name, "une belle erreur", "il manque rien"
  test.done();
