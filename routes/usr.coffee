express = require 'express'
router = express.Router()

###
* render 'usr' when get '/usr'
###
router.get '/', (req, res)->
    res.render 'usr'

module.exports = router
