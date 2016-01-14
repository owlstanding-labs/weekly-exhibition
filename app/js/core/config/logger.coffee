# Turn off $log.debug on production
angular.module(GLOBALS.ANGULAR_APP_NAME)
.config ($logProvider, $compileProvider) ->
  if GLOBALS.ENV == "production"
    $logProvider.debugEnabled(false)
    $compileProvider.debugInfoEnabled(false)
