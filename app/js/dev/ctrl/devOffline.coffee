angular.module(GLOBALS.ANGULAR_APP_NAME)
.cC
  name: 'devOfflineCtrl'
  inject: ['$scope', '$state', '$interval', '$ionicNavBarDelegate', 'appVal']
  init: ->
    @nav = @$ionicNavBarDelegate
    @$.$on '$ionicView.enter', @_ve
    @$.nv = navigator
    @val = @appVal
    @tick = @$interval =>
      log 'offline check'
    , 3000
    @$.$watch 'nv.onLine', @_online

  methods:
    _online: (n, o)->
      return unless n
      @$interval.cancel(@tick)
      state = @val.lastState
      @$state.go state.name || 'app.room', state.params,
        reload: !0
        notify: !0

    _ve: (e, v)->
      log 'offline', e.stateName
      @nav.showBar !1
