# Initialize angular's app.

app = angular.module(GLOBALS.ANGULAR_APP_NAME, [
  "classy"
  "#{GLOBALS.ANGULAR_APP_NAME}.templates"
  "ionic"
  "angulartics.google.analytics"
  "angulartics.google.analytics.cordova"
])
