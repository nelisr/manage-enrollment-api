class BasicAuthController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  http_basic_authenticate_with name: "admin_ops", password: "billing", only: :create
end