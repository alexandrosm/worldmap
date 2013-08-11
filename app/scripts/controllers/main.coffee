'use strict'

angular.module('worldmapApp')
  .controller 'MainCtrl', ['$scope', ($scope) ->
    $scope.countries = countries

    $scope.foundCounter = 0

    $scope.findCountry = ->
      country = _.find $scope.countries, (country) ->
        found = false
        if country.name?
          found = (country.name.toLowerCase() == $scope.selector.toLowerCase())
        if not found and country.alternate_names?
          found = _.any(_.map(country.alternate_names, (name)->
            $scope.selector.toLowerCase() == name.toLowerCase()
          ), Boolean)
        return found

      if country? and not country.found
        $scope.selector = ""
        country.found = true
        $scope.foundCounter = _.filter($scope.countries, {found: true}).length

    $scope.lensX = 1332
    $scope.lensY = 384

    $scope.moveLens = (evt) ->
      $scope.lensX = evt.clientX * 3
      $scope.lensY = evt.clientY * 3
  ]
