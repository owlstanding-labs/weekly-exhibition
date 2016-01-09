app = angular.module(GLOBALS.ANGULAR_APP_NAME)
ionic.Platform.ready ->
  log 'Platform.Ready - angular.bootstrap()' unless GLOBALS.ENV == 'test'
  angular.bootstrap document, [GLOBALS.ANGULAR_APP_NAME]

app.run ($log, $timeout) ->
  log "App.run - #{GLOBALS.ANGULAR_APP_NAME}" unless GLOBALS.ENV == "test"

  $timeout ->
    log 'App.run - hide splash screen'
    navigator.splashscreen?.hide()
