express = require 'express'
router = express.Router()
UserModel = require '../db/models/user.coffee'
mockData = require '../test/mock-data.coffee'

###
* render 'usr' when get '/usr'
###
router.get '/:id', (req, res)->
    res.render 'usr', usr: mockData.usr
    uid = mongoose.Types.ObjectId req.params.id
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
            res.render 'usr', usr: user, isFan: isFan

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
