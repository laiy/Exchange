var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var ObjectId = Schema.Types.ObjectId;

var InviteSchema = new Schema({
    uid         : {type: ObjectId, required: true},
    wid         : {type: ObjectId, required: true},
    sendTime    : {type: Date, default: Date.now()},
    remark      : String,
    stat        : {type: String, default: 'Waiting'},
    replyTime   : Date,
    replyMsg    : String
});

var InviteModel = mongoose.model('InviteModel', InviteSchema);

InviteModel.ref = function(iid, wid, msg, callback) {
    InviteModel.findOne({ _id: iid }, function(err, invite){
        if (invite) {
            invite.stat = 'Refused';
            invite.replyMsg = msg;
            invite.replyTime = Date.now();
            invite.save();
            callback();
        }
    });
};

InviteModel.accept = function(iid, wid, msg, callback) {
    InviteModel.findOne({ _id: iid }, function(err, invite){
        if (invite) {
            invite.stat = 'Accepted';
            invite.replyMsg = msg;
            invite.replyTime = Date.now();
            invite.save();
            callback();
        }
    });
};

module.exports = InviteModel;
