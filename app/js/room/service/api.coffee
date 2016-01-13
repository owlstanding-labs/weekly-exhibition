'use strict'
angular.module(GLOBALS.ANGULAR_APP_NAME)
.service 'roomApiSrv', (roomVal, rest)->
  val = roomVal
  entry: (id, f)->
    api = "roam/exhibits/#{id}/entry"
    rest.all(api).get('').then (r)->
      _.extend val.entry, r
      f(r) if _.isFunction f
