app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'appCtrl'
  inject: ['$scope', '$state', 'appVal']

  init: ->
    @$.$on '$ionicView.beforeEnter', @_be
    @$.$on '$ionicView.beforeLeave', @_bl
    @val = @appVal

  methods:
    _online: ->
      return if navigator.onLine
      # TODO: check server reachable
      @$state.go 'app.dev.offline'

    _bl: (e, v)->
      @val.lastState.name = e.stateName
      @val.lastState.params = e.stateParams

    _be: (e, v)->
      log 'core.app', e.stateName
      @_online()
      if _.isFunction screen.lockOrientation
        screen.lockOrientation('landscape')

    nonProd: ->
      GLOBALS.ENV isnt 'production'
