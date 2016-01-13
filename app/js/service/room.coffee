angular.module(GLOBALS.ANGULAR_APP_NAME)
.service 'roomSrv', ($timeout, $ionicViewSwitcher, $state, appVal)->
  val = appVal.room

  _idsLen: ->
    val.ids.length

  toRoom: ->
    val.rid = val.ids[val.id]
    $state.go 'app.room.dzi', id: val.rid

  next: ->
    val.id = (val.id + 1) % @_idsLen()
    # for animation
    $ionicViewSwitcher.nextDirection('forward')
    @toRoom()

  prev: ->
    val.id = (val.id + @_idsLen() - 1) % @_idsLen()
    # for animation
    $ionicViewSwitcher.nextDirection('back')
    @toRoom()
