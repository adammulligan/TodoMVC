window.Backbone ||= {}
window.Backbone.Views ||= {}

class Backbone.Views.TodoItemView extends Backbone.View
  template: Handlebars.templates['todo_item.hbs']

  tagName: 'li'

  events:
    "click input": "setCompleted"

  initialize: (options) ->
    @model = options.task

    @model.on('change', @render)
    @render()

  render: =>
    @$el.html(@template(task: @model.toJSON()))
    return @

  setCompleted: (event)=>
    isChecked = $(event.target).is(":checked")
    @model.set('completed', isChecked)

  onClose: ->
    @model.off('change', @render)
