express = require 'express'
router = express.Router()
UserModel = require '../db/models/user.coffee'

###
* render 'list' when get '/list'
###
router.get '/', (req, res)->
    {uid} = req.body
    UserModel.findOne {idCard: uid}, (err, user)->
        if err
            res.status(500).send 'Server Error.'
        else if not user
            res.json {result: 'fail', msg: 'User not found.'}
        else
            res.render 'list', usr: user

module.exports = router
