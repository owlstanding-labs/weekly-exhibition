app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'appRoomDziCtrl'
  inject: ['$scope', '$sce', '$timeout', 'roomVal']
  init: ->
    log 'appRoomDziCtrl init'
    @val = @roomVal
    @$.$on '$ionicView.enter', @_ve

  methods:
    title: ->
      "Room #{@val.id}"

    url: ->
      @$._url

    _ve: (e, v)->
      url = "https://owlstand.com/embed/#{v.stateParams.id}"
      @$timeout =>
        @$._url = @$sce.trustAsResourceUrl url
