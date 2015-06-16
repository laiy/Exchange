express = require 'express'
mongoose = require 'mongoose'
router = express.Router()
WishModel = require '../db/models/wish.coffee'
mockData = require '../test/mock-data.coffee'

###
* render 'invite' when get '/invite'
###
router.get '/:id', (req, res)->
    wid = mongoose.Types.ObjectId req.params.id
    WishModel.findOne {_id: wid}, (err, wish)->
        if err
            return res.status(500).send 'Server Error.'
        if not wish
            return res.status(404).json {result: 'fail', msg: 'Wish is not found.'}
        else
            res.render 'invite', wish: wish

###
* handle with post '/invite'
###
router.post '/', (req, res)->
    {wish, msg} = req.body
    WishModel.findOne {_id: wish}, (err, wish)->
        if err
            return res.status(500).send 'Server Error.'
        if not wish
            return res.status(404).json {result: 'fail', msg: 'Wish is not found.'}
        else
            if wish.uid.toString() is req.session.user._id
                return res.json {result: 'fail', msg: 'you are the owner of this wish.'}
            else
                WishModel.invite wish, msg, req.session.user._id, ->
                    res.json {result: 'success'}

module.exports = router
