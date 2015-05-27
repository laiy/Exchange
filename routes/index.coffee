express = require 'express'
router = express.Router()

###
* render 'index' when get '/'
###
router.get '/', (req, res)->
    res.render 'index'

module.exports = router

