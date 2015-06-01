router = express.Router()
InviteModel = require '../db/models/invite.coffee'

###
* render 'invitation' when get '/invitation'
###
router.get '/', (req, res)->
    {iid} = req.body
    InviteModel.findOne {iid: iid}, (err, invite)->
        if err
            return res.status(500).send 'Server Error.'
        if not invite
            return res.status(404).json {result: 'fail', msg: 'Invite is not found.'}
        else
            res.render 'invitation', invite: invite

###
* handle with post '/invitation'
###
router.post '/', (req, res)->
    {iid, wid, msg, ref} = req.body
    WishModel.findOne {wid: wid}, (err, wish)->
        if err
            return res.status(500).send 'Server Error.'
        if not wish
            return res.status(404).json {result: 'fail', msg: 'Wish is not found.'}
        else
            if ref
                InviteModel.ref iid, wid, msg, ->
                    res.json {result: 'success'}
            else
                InviteModel.accept iid, wid, msg, ->
                    res.json {result: 'success'}

module.exports = router
