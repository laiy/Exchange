mongoose = require "mongoose"
UserModel = require "./models/user.coffee"
config = require '../config.coffee'

db = null

###
* init database
* create a administrator
###
init = ->
    initDB ->

###
* set database URL in mongoose
* connect database
* @param callback: callback function that would call when function ended
###
initDB = (callback)->
    if process.env.NODE_ENV is "DEV"
        mongoose.connect config.TEST_DB_URI
    else
        mongoose.connect config.PRODUCTION_DB_URI
    db = mongoose.connection
    callback()

module.exports = {db, init}

