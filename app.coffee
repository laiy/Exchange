###
* import package's module that would use
###
express = require 'express'
path = require 'path'
bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'
favicon = require 'static-favicon'
busbody = require "connect-busboy"
session = require 'express-session'
logger = require 'morgan'
moment = require 'moment'
multer = require 'multer'

###
* import module that would use writen by laiy
###
db = require './db/db.coffee'
config = require './config.coffee'
util = require './common/util.coffee'

###
* import route module
###
registerRoute = require './routes/register.coffee'
logRoute = require './routes/log.coffee'
indexRoute = require './routes/index.coffee'
inviteRoute = require './routes/invite.coffee'
listRoute = require './routes/list.coffee'
usrRoute = require './routes/usr.coffee'
wishRoute = require './routes/wish.coffee'
createRoute = require './routes/create.coffee'
invitationRoute = require './routes/invitation.coffee'

###
* create a application using MVC frame 'Express'
###
app = express()

###
* use modules
###
app.locals.moment = moment
app.use favicon()
app.use logger('dev')
app.use bodyParser.json()
app.use bodyParser.urlencoded()
app.use busbody { immediate: true }
app.use express.static(path.join(__dirname, '/views'))
app.use cookieParser()
app.use session {
    secret: config.SECRET_KEY
    resave: yes
    saveUninitialized: yes
}
app.use util.setLocalsUser
app.use multer({ dest: './views/assets/img/user' })

###
* set views
###
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'

###
* use routes' handler
###
app.use '/signup', registerRoute
app.use '/Log', logRoute
app.use '/', indexRoute
app.use '/invite', inviteRoute
app.use '/list', listRoute
app.use '/user', usrRoute
app.use '/wish', wishRoute
app.use '/create', createRoute
app.use '/invitation', invitationRoute

###
* init database
###
db.init()

###
* let server listening at port 3000
###
app.listen 3000

module.exports = app

