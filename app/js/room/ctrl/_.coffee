app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'appRoomCtrl'
  inject: ['$scope', '$state', 'roomSrv', 'roomApiSrv', 'roomVal']
  init: ->
    @srv = @roomSrv
    @api = @roomApiSrv
    @srv.next()

  methods:
    next: ->
      @srv.next()

    prev: ->
      @srv.prev()

    info: ->
      log 'info', @roomVal.entry
