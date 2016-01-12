class ApplicationController < ActionController::Base
  protect_from_forgery     # with: :exception
  require 'rails/all'
  #require 'will_paginate/array'


#   def current_user
#   @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
# end
end
