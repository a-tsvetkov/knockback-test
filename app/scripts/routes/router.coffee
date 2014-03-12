define [
  'backbone'
  'knockback'
], (Backbone, kb) ->
  class Router extends Backbone.Router

    routes:
        'filter': 'filterSimple'
        'filter/extended': 'filterExtended'
        'vacancies': 'vacancies'
        'about': 'about'

    about: ->
        console.log("Executed about route!")

    filterSimple: ->
        console.log("Executed filter route!")

    filterExtended: ->
        console.log("Executed filter extended route!")

    vacancies: ->
        console.log("Executed vacancies route!")
