express = require 'express'
router = express.Router()
WishModel = require '../db/models/wish.coffee'
mockData = require '../test/mock-data.coffee'

###
* render 'index' when get '/'
###
router.get '/', (req, res)->
    res.render 'index', wishes: mockData.wishes
    WishModel.find {}, (err, wishes)->
        if err
            res.status(500).send "Server Error"
        else
            res.render 'index', wishes: wishes

module.exports = router

