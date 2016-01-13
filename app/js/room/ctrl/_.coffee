app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'appRoomCtrl'
  inject: ['$scope', '$state', 'roomSrv', 'roomApiSrv']
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
      @srv.info()
