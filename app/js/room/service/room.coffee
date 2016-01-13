angular.module(GLOBALS.ANGULAR_APP_NAME)
.service 'roomSrv', ($timeout, $ionicViewSwitcher, $state, roomVal, roomApiSrv)->
  val = roomVal
  api = roomApiSrv

  _idsLen: ->
    val.ids.length

  _reset: ->
    x = 'entry'
    return unless val[x]?
    _.each _.keys(val[x]), (k)->
      delete val[x][k]

  toRoom: ->
    id = val.ids[val.id]
    api.entry id, ->
      $state.go 'app.room.dzi', id: id

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
