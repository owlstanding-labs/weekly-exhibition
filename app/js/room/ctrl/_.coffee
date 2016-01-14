app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'roomCtrl'
  inject: ['$scope', '$timeout', 'roomSrv', '$ionicNavBarDelegate']
  init: ->
    @srv = @roomSrv
    @$.$on '$ionicView.enter', @_ve

  methods:
    _ve: (e, v)->
      # TODO: force hide
      phone = navigator.platform isnt 'iPhone'
      # phone = false
      @$ionicNavBarDelegate.showBar(phone)

    next: ->
      @srv.next()

    prev: ->
      @srv.prev()

    info: ->
      @srv.info()
