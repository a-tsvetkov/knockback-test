#/*global require*/
'use strict'

require.config
  shim:
    bootstrap:
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
    underscore: '../lib/underscore/underscoare'
    knockout: '../lib/knockout/knockout'
    knockback: '../lib/knockback/knockback'
    bootstrap: '../lib/bootstrap/dist/js/bootstrap'

require [
  'backbone'
  'knockback'
  'bootstrap'
], (Backbone, kb) ->
  Backbone.history.start()
