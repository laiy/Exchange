express = require 'express'
router = express.Router()
WishModel = require '../db/models/wish.coffee'

###
* render 'create' when get '/create'
###
router.get '/', (req, res)->
    res.render 'create'

router.post '/', (req, res)->
    {title, stt, ddl, loc, desc} = req.body
    WishModel.findOne {title: title}, (err, wish)->
        if err
            res.status(500).send 'Server Error.'
        else if wish
            res.json {result: 'fail', msg: 'Title has already existed.'}
        else
            WishModel.create title, stt, ddl, loc, desc, ->
                res.json {result: 'success'}

module.exports = router

