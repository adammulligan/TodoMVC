# BackboneDiorama TodoMVC Example

This is a todo app built using [BackboneDiorama](https://github.com/th3james/BackboneDiorama). This isn't quite a
full [TodoMVC](http://todomvc.com) app as specified by their site (yet!), but it should help you get started with
Diorama.

## Framework

BackboneDiorama is everything you need to build client-side web applications.
Optimised for developer happiness, it builds on the components of [Backbone.js](http://backbonejs.org)
and aims to be the easiest and the fastest way to build for the browser.

* `diorama new projectName` builds you a new project with:
  * Logical project structure for Backbone components
  * Coffeescript concatenation and compilation setup
  * Backbone.js+deps and Handlebars templating included and ready for use
* `diorama generate <lots-of-stuff>` - Rails-style code generators which provide convention and structure to your projects, assist you with proven patterns and allow you to rapidly prototype. Run `diorama generate` for [the full list](src/commands/generators#backbonediorama-generators).
* Additional lightweight libraries to plug the gaps in Backbone.js:
  * [*Backbone.Diorama.ManagedRegion*](src/lib/diorama_managed_region.md) - Memory managed view switching.
  * [*Backbone.Diorama.Controller*](src/lib/diorama_controller.md) - Easy switching between states in your application.
  * [*Backbone.Diorama.NestingView*](src/lib/diorama_nesting_view.md) - Nest Backbone.Views inside each other.
* New to Backbone.js? The built in conventions and patterns mean there's no easier way to get started.
* Written entirely in and for Coffeescript, for clarity and elegance of code.

Learn more at [the project homepage](https://github.com/th3james/BackboneDiorama)

## Implementation

The entry point to the application is through the TaskController, which is in src/controllers/task_controller.coffee.
Every object has been generated using `diorama generate`, then adapted.

This deviates from the TodoMVC spec a fair bit, mostly in the interests of getting a first version up and running.
Longer term, we're aiming to get it fully compliant.

## Running

You will need backbone-diorama installed on your machine:

```npm install -g backbone-diorama```

This gives you the ```diorama``` command. Use ```diorama compile watch``` (in the project directory) to auto-compile your coffeescripts to
js/application.js. Then, open index.html to start the app.

Check [the project homepage](https://github.com/th3james/BackboneDiorama) for more setup details.
