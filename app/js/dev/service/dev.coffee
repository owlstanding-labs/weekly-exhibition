angular.module(GLOBALS.ANGULAR_APP_NAME)
.service 'devSrv', (devApiSrv)->
  api = devApiSrv
  report: (k, d)->
    api.report(k, d).then (r)->
      # TODO: prevent multiple report via local storage
      log 'reported', r
