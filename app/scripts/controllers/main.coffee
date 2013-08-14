'use strict'

angular.module('worldmapApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.timerRunning = false
    $scope.gameActive = false
    $scope.gameDuration = 9

    $scope.startGame = ->
      $scope.$broadcast('timer-start')
      $scope.gameActive = true
      $scope.timerRunning = true

    $scope.pauseTimer = ->
      $scope.$broadcast('timer-stop')

    $scope.resumeTimer = ->
      $scope.$broadcast('timer-resume')
      $scope.timerRunning = true

    $scope.endGame = ->
      $scope.$broadcast('timer-stop')
      $scope.gameActive = false

    $scope.$on 'timer-stopped', (event, data) ->
      $scope.timerRunning = false
      console.log 'Timer Stopped - data = ', data

    $scope.$on 'timer-ended', (event, data) ->
      $scope.timerRunning = false
      $scope.gameActive = false
      console.log 'Timer Ended - data = ', data

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
