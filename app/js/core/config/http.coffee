angular.module(GLOBALS.ANGULAR_APP_NAME)
.config ($httpProvider) ->
  # $httpProvider.defaults.useXDomain = true
  # delete $httpProvider.defaults.headers.common['X-Requested-With']

  # Combine multiple $http requests into one $applyAsync (boosts performance)
  $httpProvider.useApplyAsync(true)

  # Add support for PATCH requests
  $httpProvider.defaults.headers.patch ||= {}
  $httpProvider.defaults.headers.patch['Content-Type'] = 'application/json'

  # Send API version code in header (might be useful in future)
  $httpProvider.defaults.headers.common["X-Api-Version"] = "1.0"

  $httpProvider.interceptors.push ($injector, $q, $log, $location) ->
    responseError: (response) ->
      $log.debug "httperror: ", response.status unless GLOBALS.ENV == "test"

      if response.status is -1
        $injector.invoke ($state)->
          $state.go 'app.dev.offline'

      # Sign out current user if we receive a 401 status.
      if response.status == 401
        $injector.invoke (Auth)->
          Auth.setAuthToken(null, null)
          $location.path("/")

      $q.reject(response)
