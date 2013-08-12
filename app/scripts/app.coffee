'use strict'

angular.module('worldmapApp', ['timer', 'ui.bootstrap'])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
  ]
