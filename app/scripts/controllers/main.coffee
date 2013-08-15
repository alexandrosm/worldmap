'use strict'

angular.module('worldmapApp')
  .controller 'MainCtrl', ($scope) ->
    # initialisations
    $scope.timerRunning = false
    $scope.gameActive = false
    $scope.countries = countries
    $scope.foundCounter = 0

    # parameters
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
      $scope.$broadcast('timer-end')
      $scope.gameActive = false

    $scope.$on 'timer-stopped', (event, data) ->
      $scope.timerRunning = false

    $scope.$on 'timer-ended', (event, data) ->
      $scope.timerRunning = false
      $scope.gameActive = false
      $scope.shouldBeOpen = true
      $scope.countriesMissed = _.where($scope.countries, {found:undefined})[1..]

    $scope.findCountry = ->
      targetName = $scope.selector.toLowerCase().replace(/^st\. /, 'st ').replace(/^st /, 'saint ')
      country = _.find $scope.countries, (country) ->
        found = false
        if country.name?
          found = (country.name.toLowerCase() == targetName)
        if not found and country.alternate_names?
          found = _.any(_.map(country.alternate_names, (name)->
           targetName == name.toLowerCase()
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

    $scope.close = ->
      $scope.shouldBeOpen = false

    $scope.items = ['item1', 'item2']

    $scope.opts =
      backdropFade: true
      dialogFade: true