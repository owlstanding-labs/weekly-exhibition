angular.module(GLOBALS.ANGULAR_APP_NAME)
.config ($stateProvider, $urlRouterProvider) ->
  s = $stateProvider
  s.state 'app',
    url: ''
    abstract: !0
    templateUrl: 'templates/core/view/app.html'
    controller: 'appCtrl'

  s.state 'app.dev',
    url: '/dev'
    templateUrl: 'templates/dev/view/_.html'
    controller: 'devCtrl'

  s.state 'app.dev.offline',
    url: '/offline'
    templateUrl: 'templates/dev/view/offline.html'
    controller: 'devOfflineCtrl'

  s.state 'app.dev.report',
    url: '/report'
    templateUrl: 'templates/dev/view/report.html'
    controller: 'devReportCtrl'

  s.state 'app.room',
    url: '/room'
    templateUrl: 'templates/room/view/_.html'
    controller: 'roomCtrl'
    resolve:
      l0: (roomSrv, roomVal)->
        return if roomVal.ids.length > 0
        roomSrv.getList()
      l1: (l0, $stateParams, roomSrv, roomVal)->
        hasId = roomVal.entry.id?
        sameId = roomVal.entry.id is $stateParams.id
        return if hasId and sameId
        roomSrv.toRoom()

  s.state 'app.room.dzi',
    url: '/:id'
    templateUrl: 'templates/room/view/dzi.html'
    controller: 'roomDziCtrl'

  # s.state 'app.second',
  #   url: 'second'
  #   templateUrl: 'templates/app/second.html'
  #   controller: 'appSecondCtrl'

  # .state "tab.pet-index",
  #   url: "/pets"
  #   views:
  #     "pets-tab":
  #       templateUrl: "templates/pet-index.html"
  #       controller: "PetIndexCtrl"

  # .state "tab.pet-detail",
  #   url: "/pet/:petId"
  #   views:
  #     "pets-tab":
  #       templateUrl: "templates/pet-detail.html"
  #       controller: "PetDetailCtrl"

  $urlRouterProvider.otherwise '/room'
