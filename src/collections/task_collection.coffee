window.Backbone ||= {}
window.Backbone.Collections ||= {}

class Backbone.Collections.TaskCollection extends Backbone.Collection
  model: Backbone.Models.Task

  clearCompleted: ->
    @reset @active()

  byStatus: (status) ->
    unless status == "all"
      return @[status]() if @[status]?

    return @models

  completed: ->
    @filter (todo) -> todo.get('completed')

  active: ->
    @without.apply @, @completed()
