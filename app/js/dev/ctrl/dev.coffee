angular.module(GLOBALS.ANGULAR_APP_NAME)
.cC
  name: 'devCtrl'
  inject: ['$scope', '$state']
  init: ->
    @$.$on '$ionicView.enter', @_ve

  methods:
    _ve: (e, v)->
      if v.stateName is 'app.dev'
        @$state.go '.report'
