#/*global require*/
'use strict'

require.config
  shim:
    bootstrap:
        deps: ['jquery']
    chosen:
        deps: ['jquery']
    underscore:
      exports: '_'
    backbone:
      deps: [
        'underscore'
        'jquery'
      ]
      exports: 'Backbone'
    knockout:
        exports: 'ko'
    knockback:
        deps: [
            'backbone'
            'knockout'
        ]
        exports: 'kb'
  paths:
    jquery: '../lib/jquery/jquery'
    backbone: '../lib/backbone/backbone'
    underscore: '../lib/underscore/underscore'
    knockout: '../lib/knockout/build/output/knockout-latest.debug'
    knockback: '../lib/knockback/knockback'
    bootstrap: '../lib/bootstrap/dist/js/bootstrap'
    chosen: '../lib/chosen/public/chosen.jquery'

require [
  'jquery'
  'application'
  'bootstrap'
  'chosen'
], ($, Application) ->
    $('.chosen-select').chosen()
    app = new Application()
    app.start()
