// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import RoundsController from "./rounds_controller.js"
application.register("rounds", RoundsController)

import SearchController from "./search_controller.js"
application.register("search", SearchController)
