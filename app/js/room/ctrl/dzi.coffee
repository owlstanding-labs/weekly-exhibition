app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'roomDziCtrl'
  inject: ['$scope', '$sce', '$ionicNavBarDelegate', '$timeout', 'roomVal']
  data: ->
    ui: @roomVal.ui
    d: @roomVal.entry

  init: ->
    log 'appRoomDziCtrl init'
    @val = @roomVal
    @nav = @$ionicNavBarDelegate
    @$.$on '$ionicView.enter', @_ve

  methods:
    url: ->
      @$._url

    _ve: (e, v)->
      url = "https://owlstand.com/embed/#{v.stateParams.id}"
      @$timeout =>
        @nav.title @val.entry.name
        @$._url = @$sce.trustAsResourceUrl url

    hide: ->
      @$.ui.info = !1
