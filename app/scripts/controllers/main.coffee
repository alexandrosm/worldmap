angular.module('worldmapApp').controller 'MainCtrl', ($scope) ->
    $scope._ = _
    $scope.timer = (evt) -> $scope.$broadcast('timer-' + evt)
    $scope.opts = {backdropFade: true, dialogFade: true}
    $scope.ocean = ocean

    $scope.$on 'timer-started', -> $scope.boardState = "playing"
    $scope.$on 'timer-resumed', -> $scope.boardState = "playing"
    $scope.$on 'timer-stopped', -> $scope.boardState = "paused"
    $scope.$on 'timer-ended',   -> $scope.boardState = "post"

    $scope.initBoard = ->
      $scope.countries = (_.extend(c, {found:false}) for c in countries)
      $scope.boardState = "pre"

    $scope.findCountry = ->
      targetName = $scope.selector.toLowerCase().replace(/^st\. /, 'st ').replace(/^st /, 'saint ')
      country = _.find $scope.countries, (country) ->
        targetName in _.map([country.name].concat(country.altNames), (str) -> str?.toLowerCase())

      country?.found = true
      $scope.selector = "" if country

    $scope.initBoard()

#    $scope.lensX = 1332
#    $scope.lensY = 384
#
#    $scope.moveLens = (evt) ->
#      $scope.lensX = evt.clientX * 3
#      $scope.lensY = evt.clientY * 3
