mongoose = require("mongoose")
IssueSchema = mongoose.Schema( 
  title: String
  author: String
  created_on: Date
  description: String
  status: String
)

Issue = mongoose.model("issue",IssueSchema)

exports.IssueSchema = IssueSchema
exports.Issue = Issue