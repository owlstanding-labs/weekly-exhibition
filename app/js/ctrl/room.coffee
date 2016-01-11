app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'appRoomCtrl'
  inject: ['$scope', '$state', 'roomSrv']
  init: ->
    @srv = @roomSrv
    @srv.next()

  methods:
    next: ->
      @srv.next()

    prev: ->
      @srv.prev()

    info: ->
      log 'info'
