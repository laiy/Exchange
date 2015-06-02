var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var ObjectId = Schema.Types.ObjectId;
var InviteModel = require('invite.js');

var WishSchema = new Schema({
    uid         : {type: ObjectId, required: true},
    stt         : {type: Date, default: Date.now()},
    loc         : {type: String, default: 'Nation'},
    ddl         : {type: Date, required: true},
    title       : {type: String, required: true},
    desc        : String
});

var WishModel = mongoose.model('WishModel', WishSchema);

WishModel.invite = function(wid, msg, uid, callback) {
    InviteModel.create({ uid    : uid,
                         wid    : wid,
                         remark : msg}, callback);
};

module.exports = WishModel;

