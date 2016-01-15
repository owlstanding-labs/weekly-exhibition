angular.module(GLOBALS.ANGULAR_APP_NAME)
.service 'devApiSrv', (rest)->
  report: (k, q)->
    rest.all('dev/mobiles').one(k, 'device').post('', q)
