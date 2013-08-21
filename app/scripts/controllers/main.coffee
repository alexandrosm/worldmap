angular.module('worldmapApp').controller 'MainCtrl', ($scope, angularFire) ->
  url = 'https://worldmap.firebaseio.com/countryhits'
  angularFire(url, $scope, 'countryHits', {}).then ->
    $scope.timer = (evt) -> $scope.$broadcast('timer-' + evt)
    $scope.opts = {backdropFade: true, dialogFade: true}
    $scope.ocean = ocean

    $scope.$on 'timer-started', -> $scope.boardState = "playing"
    $scope.$on 'timer-resumed', -> $scope.boardState = "playing"
    $scope.$on 'timer-stopped', -> $scope.boardState = "paused"
    $scope.$on 'timer-ended'  , -> $scope.boardState = "lose"

    $scope.findCountry = ->
      targetName = $scope.selector.toLowerCase().replace(/^st\. /, 'st ').replace(/^st /, 'saint ')
      country = _.find countries, (country) ->
        targetName in _.map([country.name].concat(country.altNames), (str) -> str?.toLowerCase())

      if country and not country.found
        country.found = true
        if _.filter(countries, found: false ).length == 0
          $scope.timer('stop')
          $scope.boardState = "win"
        $scope.selector = ""
        $scope.countryHits[country.id] = if $scope.countryHits[country.id] then $scope.countryHits[country.id]+1 else 1

    do $scope.initBoard = ->
      $scope.countries = (_.extend(c, found: false) for c in countries)
      $scope.boardState = "pre"

#    $scope.lensX = 1332
#    $scope.lensY = 384
#
#    $scope.moveLens = (evt) ->
#      $scope.lensX = evt.clientX * 3
#      $scope.lensY = evt.clientY * 3
