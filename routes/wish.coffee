express = require 'express'
router = express.Router()

###
* render 'wish' when get '/wish'
###
router.get '/', (req, res)->
    res.render 'wish'

###
* render 'createWish' when get '/wish/create'
###
router.get '/create', (req, res)->
    res.render 'createWish'

module.exports = router
