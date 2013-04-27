window.Backbone ||= {}
window.Backbone.Views ||= {}

class Backbone.Views.TodoListView extends Backbone.Diorama.NestingView
  template: Handlebars.templates['todo_list.hbs']

  events:
    'click #add-task': 'addTask'

  initialize: (options) ->
    @tasks = new Backbone.Collections.TaskCollection()
    @render()

  addTask: ->
    name = $('#task-name').val()

    if name.length > 0
      task = new Backbone.Models.Task()
      task.set('name', name)
      @tasks.add(task)
      @render()

  render: =>
    @closeSubViews()
    @$el.html(@template(tasks: @tasks.models))
    @renderSubViews()

    return @

  onClose: ->
    @closeSubViews()
