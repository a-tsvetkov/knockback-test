define [
  'backbone'
  'knockback'
], (Backbone, kb) ->
  class Router extends Backbone.Router

    @routes:
        'filter': 'filterSimple'
        'filter/extended': 'filterExtended'
        'vacancies': 'vacancies'
        'about': 'about'

    @execute: (callback, args)->
        alert("Executed route!")
