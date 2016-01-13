angular.module(GLOBALS.ANGULAR_APP_NAME)
.filter 'sanitize', ($sce) ->
  (val) ->
    return '' unless val?
    $sce.trustAsHtml val
