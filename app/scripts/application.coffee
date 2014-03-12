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
            @router = new Router @
            @interceptLinks()
            Backbone.history.start({pushState: true})

        interceptLinks: ->
            $('a.inner').click (e) =>
                e.preventDefault()
                path = $(e.currentTarget).attr('href')
                path = path[1..] if path[0] == '/'
                @router.navigate(path, { trigger: true })

        renderView: (viewElement) ->
            ko.releaseNode(@element)
            return if @element contains viewElement
            element.append(viewElement)
