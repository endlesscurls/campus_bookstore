class ApplicationController < ActionController::Base
  before_action :authenticate_student!

  protect_from_forgery with: :exception
end
