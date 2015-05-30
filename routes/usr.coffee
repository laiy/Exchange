express = require 'express'
router = express.Router()
UserModel = require '../db/models/user.coffee'

###
* render 'usr' when get '/usr'
###
router.get '/', (req, res)->
    {uid} = req.body
    UserModel.findOne {idCard: uid}, (err, user)->
        if err
            res.status(500).send 'Server Error.'
        else if not user
            res.json {result: 'fail', msg: 'User not found.'}
        else
            res.render 'usr', usr: user

router.post '/', (req, res)->
    {uid, op} = req.body
    UserModel.findOne {idCard: uid}, (err, user)->
        if err
            res.status(500).send 'Server Error.'
        else if not user
            res.json {result: 'fail', msg: 'User not found.'}
        else
            if op is 'fo'
                UserModel.fo uid, ->
                    res.json {result: 'success'}
            else
                UserModel.unfo uid, ->
                    res.json {result: 'success'}

module.exports = router
