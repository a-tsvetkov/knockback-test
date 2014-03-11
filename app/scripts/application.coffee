define [
  'jquery'
  'backbone'
  'knockout'
  'knockback'
  'routes/router'
], ($, Backbone, ko, kb, Router) ->
    class Application
        constructor: (@element) ->

        start: () ->
            @router = new Router
            @interceptLinks()
            Backbone.history.start({pushState: true})

        interceptLinks: ->
            self = @
            $('a.inner').click () ->
                self.router.navigate($(@).attr('href'))
                return false
