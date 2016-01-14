app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'roomCtrl'
  inject: ['$scope', '$timeout', 'roomSrv']
  init: ->
    @srv = @roomSrv
    @$.phone = navigator.platform is 'iPhone'
    @$.$on '$ionicView.enter', @_ve

  methods:
    _ve: (e, v)->

    next: ->
      @srv.next()

    prev: ->
      @srv.prev()

    info: ->
      @srv.info()
