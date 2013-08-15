angular.module('worldmapApp')
  .controller 'MainCtrl', ($scope) ->
    $scope._ = _
    $scope.broadcast = $scope.$broadcast
    $scope.opts = {backdropFade: true, dialogFade: true}
    $scope.ocean = ocean

    $scope.initGame = ->
      # initialisations
      $scope.countries = (_.extend(c, {found:false}) for c in countries)

      $scope.timerRunning = false
      $scope.gameActive = false
      $scope.modalOpen = false

      #parameters
      $scope.gameDuration = 900

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
      $scope.modalOpen = true

    $scope.findCountry = ->
      targetName = $scope.selector.toLowerCase().replace(/^st\. /, 'st ').replace(/^st /, 'saint ')
      country = _.find $scope.countries, (country) ->
        targetName in _.map([country.name].concat(country.altNames), (str) -> str?.toLowerCase())

      if country?
        $scope.selector = ""
        country.found = true

    $scope.initGame()

#    $scope.lensX = 1332
#    $scope.lensY = 384
#
#    $scope.moveLens = (evt) ->
#      $scope.lensX = evt.clientX * 3
#      $scope.lensY = evt.clientY * 3
