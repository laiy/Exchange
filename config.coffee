config = exports

###
* set process environment
###
if not process.env.NODE_ENV
    process.env.DEBUG = "Exchange"
    process.env.NODE_ENV = "DEV"

###
* set database url
###
config.TEST_DB_URI = "mongodb://localhost/mocha-test"
config.PRODUCTION_DB_URI = "mongodb://localhost/exchange"
config.SECRET_KEY = "-a052-31av5-4s2voo17sjasf-j2-s"

