'use strict'

describe 'Controller: MainCtrl', (_) ->

  # load the controller's module
  beforeEach module 'ngRoute'
  beforeEach module 'timer'
  beforeEach module 'ui.bootstrap'
  beforeEach module 'worldmapApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  it 'should attach a list of countries to the scope', () ->
    expect(scope.countries.length).toBe 241;
