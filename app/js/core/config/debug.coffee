# Useful for debugging, like `$a("$rootScope")`
angular.module(GLOBALS.ANGULAR_APP_NAME)
.run ($window, $injector) ->
  return if GLOBALS.ENV isnt 'development'
  $window.$a = $injector.get
