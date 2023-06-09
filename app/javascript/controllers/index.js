// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import FilteringController from "./filtering_controller"
application.register("filtering", FilteringController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import LockCarouselController from "./lock_carousel_controller"
application.register("lock-carousel", LockCarouselController)

import OutfitController from "./outfit_controller"
application.register("outfit", OutfitController)

import WeatherController from "./weather_controller"
application.register("weather", WeatherController)
