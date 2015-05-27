express = require 'express'
router = express.Router()

###
* render 'invite' when get '/invite'
###
router.get '/', (req, res)->
    res.render 'invite'

###
* render 'invitation' when get '/invite/invitation'
###
router.get '/invitation', (req, res)->
    res.render 'invitation'


module.exports = router
