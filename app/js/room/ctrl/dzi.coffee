app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'appRoomDziCtrl'
  inject: ['$scope', '$sce', '$timeout', 'roomVal']
  data: ->
    ui: @roomVal.ui
    d: @roomVal.entry

  init: ->
    log 'appRoomDziCtrl init'
    @val = @roomVal
    @$.$on '$ionicView.enter', @_ve

  methods:
    title: ->
      if @val.entry.id?
        @val.entry.name
      else
        'Loading...'

    url: ->
      @$._url

    _ve: (e, v)->
      url = "https://owlstand.com/embed/#{v.stateParams.id}"
      @$timeout =>
        @$._url = @$sce.trustAsResourceUrl url

    hide: ->
      @$.ui.info = !1
