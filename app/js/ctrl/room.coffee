app = angular.module(GLOBALS.ANGULAR_APP_NAME)
app.cC
  name: 'appRoomCtrl'
  inject: ['$scope', '$state', 'appVal', '$sce', '$timeout']
  data: ->
    ids: [
      '922e62ce-b4d5-4688-98bb-070ef9adf572'
      '41e48488-651e-40b1-a8b4-59e1b50177dc'
      '8ba7bacf-603c-4ae4-9b88-5521a29381dd'
    ]

  init: ->
    @val = @appVal.room
    @$.$on '$stateChangeSuccess', @_scss

  methods:
    _scss: (e, ts, tp, fs, fp)->
      return unless tp.id?
      url = "https://owlstand.com/embed/#{tp.id}"
      @$timeout =>
        @$.url = @$sce.trustAsResourceUrl url

    title: ->
      "Room #{@val.id}"

    _idsLen: ->
      @$.ids.length

    _toRoom: ->
      id = @$.ids[@val.id]
      @$state.go 'app.room', id: id

    next: ->
      @val.id = (@val.id + 1) % @_idsLen()
      @_toRoom()

    prev: ->
      @val.id = (@val.id + @_idsLen() - 1) % @_idsLen()
      @_toRoom()
