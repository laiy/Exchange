express = require 'express'
mongoose = require 'mongoose'
router = express.Router()
UserModel = require '../db/models/user.coffee'
mockData = require '../test/mock-data.coffee'

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
            res.render 'list', usr: user

module.exports = router
