angular.module(GLOBALS.ANGULAR_APP_NAME)
.cC
  name: 'devReportCtrl'
  inject: ['$scope', 'devSrv']
  data: ->
    fkey: ['javaEnabled', 'vibrate']
  init: ->
    @$.$on '$ionicView.enter', @_ve
    @$.code = (Math.random()*0xFFFFF<<0).toString(16)
    @_parseNav()

  methods:
    _parseNav: ->
      ks = _.keysIn(navigator)
      @$.navKeys = _.reject ks, (k)->
        _.isFunction navigator[k]
      @$.nav = navigator

    _ve: ->
      console.log 'dev'

    navVal: (k)->
      v = navigator[k]
      if v is '' or (!v?)
        'N/A'
      else
        v

    navFun: (k)->
      navigator[k]()

    _navInfo: ->
      _.reduce @$.navKeys, (o, k)=>
        return o if k is 'serviceWorker'
        o[k] = @navVal(k)
        o
      , {}

    _devInfo: ->
      nav: @_navInfo()
      cfg: GLOBALS

    send: ->
      # log @_navInfo()
      @devSrv.report @$.code, @_devInfo()