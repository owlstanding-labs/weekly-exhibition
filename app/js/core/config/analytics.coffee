return unless GLOBALS.CORDOVA_GOOGLE_ANALYTICS_ID
ionic.Platform.ready ->
  angular.module(GLOBALS.ANGULAR_APP_NAME)
  .config (googleAnalyticsCordovaProvider) ->
    googleAnalyticsCordovaProvider.debug = GLOBALS.ENV != 'production'
    googleAnalyticsCordovaProvider.trackingId = GLOBALS.CORDOVA_GOOGLE_ANALYTICS_ID
