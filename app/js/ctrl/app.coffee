app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'appCtrl'
  inject: ['$scope']

  init: ->
    log 'appCtrl init'

  methods:
    ok: -> ''
