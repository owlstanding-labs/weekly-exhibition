app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'appCtrl'
  inject: ['$scope', '$state']

  init: ->
    @$.$on '$ionicView.beforeEnter', @_viewChange

  methods:
    _online: ->
      return if navigator.onLine
      # TODO: check server reachable
      @$state.go 'app.dev.offline'

    _viewChange: ->
      log 'view changed'
      @_online()
      if _.isFunction screen.lockOrientation
        screen.lockOrientation('landscape')

    nonProd: ->
      GLOBALS.ENV isnt 'production'
