express = require 'express'
mongoose = require 'mongoose'
router = express.Router()
WishModel = require '../db/models/wish.coffee'
mockData = require '../test/mock-data.coffee'

###
* render 'wish' when get '/wish'
###
router.get '/:id', (req, res)->
    res.render 'wish', wish: mockData.wish
    wid = mongoose.Types.ObjectId req.params.id
    WishModel.findOne {wid: wid}, (err, wish)->
        if err
            return res.status(500).send 'Server Error.'
        if not wish
            return res.status(404).json {result: 'fail', msg: 'Wish is not found.'}
        else
            res.render 'wish', wish: wish

###
* handle wish post '/wish'
###
router.post '/', (req, res)->
    {appr, wid} = req.body
    WishModel.findOne {wid: wid}, (err, wish)->
        if err
            return res.status(500).send 'Server Error.'
        if not wish
            return res.status(404).json {result: 'fail', msg: 'Wish is not found.'}
        else
            if appr is 0
                return json {result: 'fail', msg: 'todo'}

module.exports = router
