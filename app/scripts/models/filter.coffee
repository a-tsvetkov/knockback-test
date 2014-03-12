define [
  'underscore'
  'backbone'
], (_, Backbone) ->

    class FilterModel extends Backbone.Model

        defaults:
            text: ''
            currency: 'RUB'
