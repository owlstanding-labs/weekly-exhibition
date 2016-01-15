app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'appCtrl'
  inject: ['$scope']

  init: ->
    log 'appCtrl init'
    @$.$on '$ionicView.beforeEnter', @_viewChange

  methods:
    _viewChange: ->
      log 'view changed'
      if _.isFunction screen.lockOrientation
        screen.lockOrientation('landscape')

    nonProd: ->
      GLOBALS.ENV isnt 'production'
