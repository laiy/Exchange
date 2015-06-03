mongoose = require('mongoose')
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

InviteSchema = new Schema
    uid         : {type: ObjectId, required: true},
    wid         : {type: ObjectId, required: true},
    sendTime    : {type: Date, default: Date.now()},
    remark      : String,
    stat        : {type: String, default: 'Waiting'},
    replyTime   : Date,
    replyMsg    : String

InviteModel = mongoose.model('InviteModel', InviteSchema)

InviteModel.ref = (iid, wid, msg, callback)->
    InviteModel.findOne { _id: iid }, (err, invite)->
        if invite
            invite.stat = 'Refused'
            invite.replyMsg = msg
            invite.replyTime = Date.now()
            invite.save ->
                callback()

InviteModel.accept = (iid, wid, msg, callback)->
    InviteModel.findOne { _id: iid }, (err, invite)->
        if invite
            invite.stat = 'Accepted'
            invite.replyMsg = msg
            invite.replyTime = Date.now()
            invite.save ->
                callback()

module.exports = InviteModel

