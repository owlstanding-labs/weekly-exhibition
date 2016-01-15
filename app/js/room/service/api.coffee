'use strict'
angular.module(GLOBALS.ANGULAR_APP_NAME)
.service 'roomApiSrv', (roomVal, rest)->
  val = roomVal
  entry: (id, f)->
    api = "roam/exhibits/#{id}/entry"
    rest.all(api).get('').then (r)->
      _.extend val.entry, r
      f(r) if _.isFunction f
  list: (kind = 'landing')->
    api = 'landing/heros/list'
    rest.all(api).get('', kind: kind).then (r)->
      val.ids = r
