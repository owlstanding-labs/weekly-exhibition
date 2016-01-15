angular.module(GLOBALS.ANGULAR_APP_NAME)
.cC
  name: 'devOfflineCtrl'
  inject: ['$scope', '$ionicNavBarDelegate']
  init: ->
    log 'defOffline'
    @$.$on '$ionicView.enter', @_ve
    @nav = @$ionicNavBarDelegate

  methods:
    _ve: (e, v)->
      @nav.showBar !1
