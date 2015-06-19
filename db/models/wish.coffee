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
    uIdCard     : String

WishModel = mongoose.model('WishModel', WishSchema);

WishModel.invite = (wid, msg, uid, callback)->
    WishModel.findOne {_id: wid}, (err, wish)->
        if wish
            console.log wish
            InviteModel.create
                uid    : uid,
                wid    : wid,
                remark : msg
                wishOwner: wish.uid
            , callback

WishModel.createWish = (uid, title, stt, ddl, loc, desc, uIdCard, callback)->
    WishModel.create
        uid: uid
        title: title,
        stt: stt,
        ddl: ddl,
        loc: loc,
        desc: desc,
        uIdCard: uIdCard
    , callback

module.exports = WishModel;

