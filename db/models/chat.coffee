mongoose = require('mongoose')
Schema = mongoose.Scheme
ObjectId = Schema.Types.ObjectId

ChatSchema = new Schema
    iid : {type: ObjectId, required: true},
    msg : [{content: {type: String, required: true}, time: {type: Date, default: Date.now()}, direction: {type: Boolean, required: true}}]

ChatModel = mongoose.model('ChatModel', ChatSchema)

module.exports = ChatModel

