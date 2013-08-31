angular.module('worldmapApp')
  .controller 'MainCtrl', ($log, $scope, angularFire, $q, $http, $routeParams) ->

    $scope.duration = $routeParams.duration || 900

    firebaseUrl = 'https://worldmap.firebaseio.com/countryhits'
    promises = [
      $http.get('/data/countries.json')
      angularFire(firebaseUrl, $scope, 'countryHits', {})
    ]

    $q.all(promises).then (countryResponse) ->
      countries = countryResponse[0].data
      $scope.timer = (evt) -> $scope.$broadcast('timer-' + evt)
      $scope.opts = {backdropFade: true, dialogFade: true}
      $scope.input = {}
      $scope.continents = ['Europe', 'Asia', 'Africa', 'North America', 'South America', 'Oceania']

      $scope.$on 'timer-started', -> $scope.boardState = "playing"
      $scope.$on 'timer-resumed', -> $scope.boardState = "playing"
      $scope.$on 'timer-stopped', -> $scope.boardState = "paused"
      $scope.$on 'timer-ended'  , -> $scope.boardState = "lose"

      $scope.findCountry = ->
        targetName = $scope.input.country.toLowerCase().replace(/^st\. /, 'st ').replace(/^st /, 'saint ')
        country = _.find countries, (country) ->
          targetName in _.map([country.name].concat(country.altNames), (str) -> str?.toLowerCase())

        if country and not country.found
          country.found = true
          if _.filter(countries, found: false ).length == 0
            $scope.timer('stop')
            $scope.boardState = "win"
          $scope.input.country = ""
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
