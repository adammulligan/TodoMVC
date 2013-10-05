window.Backbone ||= {}
window.Backbone.Views ||= {}

class Backbone.Views.TaskListView extends Backbone.Diorama.NestingView
  template: Handlebars.templates['task_list.hbs']

  events:
    'keypress #new-todo': 'addOnEnter'
    'click #filters a': 'setFilter'
    'click #clear-completed': 'clearCompleted'

  initialize: (options) ->
    Handlebars.registerHelper('remainingCount', @remainingCount)
    Handlebars.registerHelper('completedCount', @completedCount)

    @tasks = new Backbone.Collections.TaskCollection()

    @tasks.on('change', @render)
    @tasks.on('destroy', @render)
    @tasks.on('reset', @render)

    @render()

  addOnEnter: (event) ->
    if (event.which == 13)
      @addTask()

  addTask: ->
    name = $('#new-todo').val().trim()

    if name.length > 0
      task = new Backbone.Models.Task()
      task.set('name', name)
      @tasks.add(task)
      @render()

  setFilter: (event) ->
    @filter = $(event.target).text().toLowerCase()

    @render()

  clearCompleted: ->
    @tasks.clearCompleted()

  remainingCount: =>
    count = @tasks.active().length

    word = "items"
    word = "item" if count == 1

    new Handlebars.SafeString("#{count} #{word}")

  completedCount: =>
    @tasks.completed().length

  render: =>
    tasks = @tasks.models
    if @filter?
      tasks = @tasks.byStatus(@filter)

    # Render template, creating subviews with addSubViewTo helper (see template)
    @$el.html(@template(thisView: @, tasks: tasks))
    # Attaches sub views (but does not call render)
    @attachSubViews()

    return @

  onClose: ->
    @closeSubViews()
