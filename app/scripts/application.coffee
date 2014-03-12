define [
  'jquery'
  'backbone'
  'knockout'
  'routes/router'
], ($, Backbone, ko, Router) ->
    class Application

        constructor: (@element) ->
            @router = new Router @
            @currentRoute = ko.observable()
            @router.on 'route', (route, params) => @currentRoute(route)

            @currentPath = ko.computed () => @router.getPathForRoute(@currentRoute())

            @menuItems = [
                { href: '/filter', name: 'Настройки' }
                { href: '/vacancies', name: 'Вакансии'}
                { href: '/about', name: 'О приложении'}
            ]


        start: () ->
            @interceptLinks()
            Backbone.history.start({pushState: true})

        interceptLinks: ->
            $('a.inner').click (e) =>
                e.preventDefault()
                path = $(e.currentTarget).attr('href')
                path = path[1..] if path[0] == '/'
                @router.navigate(path, { trigger: true })

        renderView: (viewElement) ->
            return if $.contains(@element, viewElement)
            @element.empty()
            @element.append(viewElement)
