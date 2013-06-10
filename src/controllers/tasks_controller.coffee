window.Backbone ||= {}
window.Backbone.Controllers ||= {}

class Backbone.Controllers.TasksController extends Backbone.Diorama.Controller
  constructor: ->
    # Create a region to hold our views
    @mainRegion = new Backbone.Diorama.ManagedRegion()
    $('#app').append(@mainRegion.$el)

    # Default state
    @start()

  start: =>
    taskListView = new Backbone.Views.TaskListView()
    @mainRegion.showView(taskListView)
