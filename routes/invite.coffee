express = require 'express'
router = express.Router()
WishModel = require '../db/models/wish.coffee'
mockData = require '../test/mock-data.coffee'

###
* render 'invite' when get '/invite'
###
router.get '/:id', (req, res)->
    wid = mongoose.Types.ObjectId req.params.id
    res.render 'invite', wish: mockData.wish
    WishModel.findOne {wid: wid}, (err, wish)->
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
    WishModel.findOne {wid: wish}, (err, wish)->
        if err
            return res.status(500).send 'Server Error.'
        if not wish
            return res.status(404).json {result: 'fail', msg: 'Wish is not found.'}
        else
            WishModel.invite wish, msg, ->
                res.json {result: 'success'}

module.exports = router
