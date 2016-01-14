'use strict'
angular.module(GLOBALS.ANGULAR_APP_NAME)
.service 'rest', (Restangular)->
  _underscoreToCamelCase = (string) ->
    string.replace /(\_[a-z])/g, ($1) ->
      $1.toUpperCase().replace '_', ''

  _camelCaseToUnderscore = (string) ->
    string.replace /([A-Z])/g, ($1) ->
      '_' + $1.toLowerCase()

  # Recursively map keys of given object
  recursiveKeyTransformation = (o, fn) ->
    if angular.isArray(o)
      angular.forEach o, (item, i) ->
        o[i] = recursiveKeyTransformation(item, fn)
        return
    else if angular.isObject(o)
      angular.forEach o, (item, key) ->
        newKey = fn(key)
        o[newKey] = recursiveKeyTransformation(item, fn)
        if newKey != key
          delete o[key]
      return o
    o

  camelCaseToUnderscore = (element, operation, route, url, headers, params, httpConfig) ->
    recursiveKeyTransformation(element, _camelCaseToUnderscore)
    recursiveKeyTransformation(params, _camelCaseToUnderscore)
    # { element: element }

  underscoreToCamelCase = (data, operation, what, url, response, deferred)->
    recursiveKeyTransformation(data, _underscoreToCamelCase)

  errors = (rsp, deferred, responseHandler)->
    if rsp.status is 500
      console.log 'internal server errrror'
    true

  rest = Restangular.withConfig (RestangularConfigurer)->
    RestangularConfigurer.setBaseUrl GLOBALS.API_HOST
    RestangularConfigurer.setRequestSuffix ".json"
  rest.addFullRequestInterceptor(camelCaseToUnderscore)
  rest.addResponseInterceptor(underscoreToCamelCase)
  rest.setErrorInterceptor(errors)

  rest
