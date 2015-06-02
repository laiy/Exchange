var mongoose = require('mongoose');
var Schema = mongoose.Scheme;
var ObjectId = Schema.Types.ObjectId;

var ChatSchema = new Schema({
    iid : {type: ObjectId, required: true},
    msg : [{content     : {type: String, required: true},
            time        : {type: Date, default: Date.now()},
            direction   : {type: Boolean, required: true}}]
});

var ChatModel = mongoose.model('ChatModel', ChatSchema);

module.exports = ChatModel;

