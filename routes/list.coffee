express = require 'express'
router = express.Router()

###
* render 'list' when get '/list'
###
router.get '/', (req, res)->
    res.render 'list'

module.exports = router
