 var mongoose = require('mongoose');
 var Schema = mongoose.Schema;
 var ObjectId = Schema.Types.ObjectId;
 var util = require('../../common/util.coffee');
 
 var UserSchema = new Schema({
     email      : {type: String, required: true},
     password   : {type: String, required: true},
     name       : String,
     idCard     : String,
     loc        : String,
     fans       : [ObjectId],
     following  : [ObjectId]
 });

var UserModel = mongoose.model('UserModel', UserSchema);

UserModel.createUser = function(name, idCard, loc, email, password, callback) {
    UserModel.create({
        name        : name,
        password    : util.enctype(password),
        idCard      : idCard,
        loc         : loc,
        email       : email,
        fans        : [],
        following   : []
    }, callback);
};

UserModel.fo = function(uid1, uid2, callback) {
    UserModel.findOne({ _id: uid1 }, function(err, user1) {
        if (user1) {
            UserModel.findOne({{ _id: uid2 }, function(err, user2) {
                if (user2) {
                    user1.following.unshift(uid2);
                    user2.fans.unshift(uid1);
                    user1.save();
                    user2.save();
                    callback();
                }
            });
            callback();
        }
    });
};

UserModel.unfo = function(uid1, uid2, callback) {
    UserModel.findOne({ _id: uid1 }, function(err, user1) {
        if (user1) {
            UserModel.findOne({{ _id: uid2 }, function(err, user2) {
                if (user2) {
                    user1.following.remove(user1.following.indexOf(uid2));
                    user2.fans.remove(user2.fans.indexOf(uid1));
                    user1.save();
                    user2.save();
                    callback();
                }
            });
            callback();
        }
    });
};

module.exports = UserModel;

