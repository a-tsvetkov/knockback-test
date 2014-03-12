define [
  'underscore'
  'backbone'
  'knockback'
  'viewmodels/filter'
  'viewmodels/vacancies'
], (_, Backbone, kb, FilterViewModel, VacanciesViewModel) ->
  class Router extends Backbone.Router

    constructor: (@app, options) ->
        super options

    routes:
        '': 'index'
        'filter': 'filter'
        'vacancies': 'vacancies'
        'about': 'about'

    applyViewModel: (view_model, options) ->
        template = view_model.template_name
        @applyTemplate(template, view_model, options)

    applyTemplate: (template, view_model, options) ->
        if options
            @app.renderView(
                kb.renderTemplate(template, view_model, options)
            )
        else
            @app.renderView(
                kb.renderTemplate(template, view_model)
            )

    getPathForRoute: (route) ->
        routes = _.filter(_.pairs(@routes), (p) -> p[1] == route)
        paths = _.map(routes, (r) -> '/' + r[0])
        return paths[0] if paths.length > 0

    index: -> @navigate('filter', { trigger: true })

    about: ->
        console.log("Executed about route!")
        @applyTemplate('about.html', {})

    filter: ->
        console.log("Executed filter route!")
        @applyViewModel(FilterViewModel)

    vacancies: ->
        console.log("Executed vacancies route!")
        @applyViewModel(VacanciesViewModel)
