express = require 'express'
mongoose = require 'mongoose'
router = express.Router()
UserModel = require '../db/models/user.coffee'
mockData = require '../test/mock-data.coffee'
async = require 'async'

###
* render 'list' when get '/list'
###
router.get '/:id', (req, res)->
    uid = mongoose.Types.ObjectId req.params.id
    UserModel.findOne {_id: uid}, (err, user)->
        if err
            res.status(500).send 'Server Error.'
        else if not user
            res.json {result: 'fail', msg: 'User not found.'}
        else
            fans = []
            followings = []
            async.each user.fans, (fan, callback)->
                UserModel.findOne {_id: fan}, (err, user)->
                    fans.push user
                    callback()
            , (err)->
                async.each user.following, (follow, callback)->
                    UserModel.findOne {_id: follow}, (err, user)->
                        followings.push user
                        callback()
                , (err)->
                    res.render 'list', fans: fans, followings: followings

module.exports = router
