express = require 'express'
mongoose = require 'mongoose'
router = express.Router()
UserModel = require '../db/models/user.coffee'
mockData = require '../test/mock-data.coffee'
InviteModel = require '../db/models/invite.coffee'

###
* render 'usr' when get '/usr'
###
router.get '/:id', (req, res)->
    uid = req.params.id
    UserModel.findOne {idCard: uid}, (err, user)->
        if err
            res.status(500).send 'Server Error.'
        else if not user
            res.json {result: 'fail', msg: 'User not found.'}
        else
            isFan = false
            for fan in user.fans
                if fan is req.session.user._id
                    isFan = true
            InviteModel.find {wishOwner: user._id, stat: 'Waiting'}, (err, invites)->
                res.render 'usr', usr: user, isFan: isFan, invites: invites

router.post '/', (req, res)->
    {uid, op} = req.body
    UserModel.findOne {idCard: uid}, (err, user)->
        if err
            res.status(500).send 'Server Error.'
        else if not user
            res.json {result: 'fail', msg: 'User not found.'}
        else
            if op is 'fo'
                UserModel.fo req.session.user._id, user._id, ->
                    console.log 'fo'
                    res.json {result: 'success'}
            else
                UserModel.unfo req.seesion.user._id, user._id, ->
                    console.log 'unfo'
                    res.json {result: 'success'}

module.exports = router
