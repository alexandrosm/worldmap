'use strict'

angular.module('worldmapApp', [
    'firebase'
    'ngRoute'
    'timer'
    'ui.bootstrap'
    'ui.keypress'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/time/:duration',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
