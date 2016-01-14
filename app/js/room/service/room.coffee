angular.module(GLOBALS.ANGULAR_APP_NAME)
.service 'roomSrv', ($ionicNavBarDelegate, $timeout, $ionicViewSwitcher, $state, roomVal, roomApiSrv)->
  val = roomVal
  api = roomApiSrv
  nav = $ionicNavBarDelegate

  _idsLen: ->
    val.ids.length

  _reset: ->
    x = 'entry'
    return unless val[x]?
    _.each _.keys(val[x]), (k)->
      delete val[x][k]

  toRoom: ->
    nav.title 'loading...'
    id = val.ids[val.id]
    api.entry id, (r)->
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

  info: ->
    ca = document.getElementsByTagName('iframe')[0]
    ca.blur(30)
    val.ui.info = !val.ui.info
