window.Backbone ||= {}
window.Backbone.Views ||= {}

class Backbone.Views.TaskItemView extends Backbone.View
  template: Handlebars.templates['task_item.hbs']

  tagName: 'li'

  events:
    "click input": "setCompleted"
    "click .destroy": "clear"

  initialize: (options) ->
    @model = options.task

    @model.on('change', @render)
    @model.on('destroy', @remove)

    @render()

  render: =>
    @$el.html(@template(task: @model.toJSON()))

    if @model.get('completed')
      @$el.attr('class', 'completed')

    return @

  remove: =>
    @$el.remove()
    @stopListening()

  clear: ->
    @model.destroy()

  setCompleted: (event)=>
    isChecked = $(event.target).is(":checked")
    @model.set('completed', isChecked)

  onClose: ->
    @model.off('change', @render)
