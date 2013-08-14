'use strict'

angular.module('worldmapApp', ['ngRoute', 'timer', 'ui.bootstrap'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
