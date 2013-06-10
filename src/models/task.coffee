window.Backbone.Models || = {}

class window.Backbone.Models.Task extends Backbone.Model
  defaults:
    title: ''
    completed: false

  toggle: ->
    @set('completed', !@get('completed'))
    @save()
