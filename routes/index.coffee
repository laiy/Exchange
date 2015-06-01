express = require 'express'
router = express.Router()
WishModel = require '../db/models/wish.coffee'

###
* render 'index' when get '/'
###
router.get '/', (req, res)->
    WishModel.find {}, (err, wishes)->
        if err
            res.status(500).send "Server Error"
        else
            res.render 'index', wishes: wishes

module.exports = router

