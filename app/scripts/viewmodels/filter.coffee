define [
    'jquery'
    'knockout'
    'knockback'
    'models/filter'
    'chosen'
], ($, ko, kb, Filter) ->
    class FilterViewModel
        @template_name = 'filter_simple.html'

        constructor: ->
            $('.chosen-select').on 'load', (e) ->
                e.currentTarget.chosen()

            filter = new Filter({text: 'test'})
            @text = ko.observable(filter.get('text'))
