app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'roomCtrl'
  inject: ['$scope', '$timeout', 'roomSrv']
  init: ->
    @srv = @roomSrv
    @_checkPhone()
    @$.$on '$ionicView.enter', @_ve

  methods:
    _checkPhone: ->
      p = navigator.platform
      @$.phone = (p is 'iPhone') or (p is 'iPod')

    _ve: (e, v)->

    next: ->
      @srv.next()

    prev: ->
      @srv.prev()

    info: ->
      @srv.info()
