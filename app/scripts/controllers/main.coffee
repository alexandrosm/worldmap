angular.module('worldmapApp').controller 'MainCtrl', ($scope) ->
  $scope.timer = (evt) -> $scope.$broadcast('timer-' + evt)
  $scope.opts = {backdropFade: true, dialogFade: true}
  $scope.ocean = ocean

  $scope.$on 'timer-started', -> $scope.boardState = "playing"
  $scope.$on 'timer-resumed', -> $scope.boardState = "playing"
  $scope.$on 'timer-stopped', -> $scope.boardState = "paused"
  $scope.$on 'timer-ended'  , -> $scope.boardState = "post"

  $scope.findCountry = ->
    targetName = $scope.selector.toLowerCase().replace(/^st\. /, 'st ').replace(/^st /, 'saint ')
    country = _.find _.filter(countries, { dependencyOf: false }), (country) ->
      targetName in _.map([country.name].concat(country.altNames), (str) -> str?.toLowerCase())

    if country and not country.found
      country.found = true
      if _.filter(countries, { dependencyOf: false, found: false }).length == 0
        $scope.timer('end')
      $scope.selector = ""

  do $scope.initBoard = ->
    $scope.countries = (_.defaults(_.extend(c, found: false), dependencyOf: false) for c in countries)
    $scope.boardState = "pre"

#    $scope.lensX = 1332
#    $scope.lensY = 384
#
#    $scope.moveLens = (evt) ->
#      $scope.lensX = evt.clientX * 3
#      $scope.lensY = evt.clientY * 3
