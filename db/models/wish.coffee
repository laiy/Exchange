mongoose = require('mongoose')
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId
InviteModel = require './invite.coffee'

WishSchema = new Schema
    uid         : {type: ObjectId, required: true},
    stt         : {type: Date, default: Date.now()},
    loc         : {type: String, default: 'Nation'},
    ddl         : {type: Date, required: true},
    title       : {type: String, required: true},
    desc        : String

WishModel = mongoose.model('WishModel', WishSchema);

WishModel.invite = (wid, msg, uid, callback)->
    InviteModel.create
        uid    : uid,
        wid    : wid,
        remark : msg
    , callback

module.exports = WishModel;

