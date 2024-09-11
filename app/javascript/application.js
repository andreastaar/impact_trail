// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

//= require flatpickr_initialization

import { Application } from "stimulus";
import { Turbo } from "@hotwired/turbo-rails";
import ToggleController from "../controllers/toggle_controller";
import ImageUploadController from "../controllers/image_upload_controller";

const application = Application.start();
application.register("toggle", ToggleController);
application.register("image-upload", ImageUploadController);
