express = require 'express'
gm = require 'gm'
UserModel = require '../db/models/user.coffee'
imageMagick = gm.subClass { imageMagick: true }
router = express.Router()
util = require '../common/util.coffee'

###
* handle when post '/register/regist'
* return fail when the username has already existed
* return fail when bad params occur
* create a new user with username, password and email
* create avatar named user._id + '.png'
* @param username: user's name(one and only)
* @param password: user's password
* @param email: user's email
###
router.post '/', (req, res)->
    {name, idCard, loc, email} = req.body
    console.log name
    console.log idCard
    console.log loc
    console.log email
    UserModel.findOne {idCard: idCard}, (err, user)->
        console.log user
        if user
            return res.json {result: 'fail', msg: 'Idcard has already existed.'}
        else if not /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/.test(idCard)
            return res.json {result: 'fail', msg: 'Invalid idCard.'}
        else if not /^([a-zA-Z0-9\u4e00-\u9fa5]+[_|\_|\.-]?)*[a-zA-Z0-9\u4e00-\u9fa5]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email)
            return res.json {result: 'fail', msg: 'The form of email is invalid.'}
        else
            UserModel.createUser name, idCard, loc, email, ->
                res.json {result: 'success'}

###
* render 'register' when get '/register'
###
router.get '/', (req, res)->
    res.render 'register'

module.exports = router

