mongoose = require('mongoose')
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId
util = require('../../common/util.coffee')

UserSchema = new Schema
    email      : {type: String, required: true},
    name       : String,
    idCard     : String,
    loc        : String,
    fans       : [ObjectId],
    following  : [ObjectId]

UserModel = mongoose.model('UserModel', UserSchema)

UserModel.createUser = (name, idCard, loc, email, callback)->
    UserModel.create
        name        : name,
        idCard      : idCard,
        loc         : loc,
        email       : email,
        fans        : [],
        following   : []
    , callback

UserModel.fo = (uid1, uid2, callback)->
    UserModel.findOne { _id: uid1 }, (err, user1)->
        if user1
            UserModel.findOne { _id: uid2 }, (err, user2)->
                if (user2)
                    user1.following.unshift(uid2)
                    user2.fans.unshift(uid1)
                    user1.save ->
                        user2.save ->
                            callback()
            callback()

UserModel.unfo = (uid1, uid2, callback)->
    UserModel.findOne { _id: uid1 }, (err, user1)->
        if user1
            UserModel.findOne { _id: uid2 }, (err, user2)->
                if user2
                    user1.following.remove(user1.following.indexOf(uid2))
                    user2.fans.remove(user2.fans.indexOf(uid1))
                    user1.save ->
                        user2.save ->
                            callback()
            callback()

module.exports = UserModel

