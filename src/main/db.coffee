require("js-yaml")

p = require("./properties.yml").db
mongoose = require "mongoose"
db_url = "mongodb://#{p.username}:#{p.password}@#{p.host}:#{p.port}/#{p.db_name}"

db = mongoose.connection;
#db.on('error', console.error.bind( console, 'connection error:') )



mongoose.connect( db_url ) 
###
  console.log "Started connection on #{db_url}".cyan + ", waiting for it to open...".grey
  db.on "open", (ref) ->
    console.log "Connected to mongo server!".green

  db.on "connecting", (ref) ->
    console.log "Connecting to mongo server!".green

  db.on "close", (ref) ->
    console.log "Closing connection to mongo server!".green
###
db.on "error", (err) ->
  console.log "Could not connect to mongo server!".yellow
  console.log err.message.red



