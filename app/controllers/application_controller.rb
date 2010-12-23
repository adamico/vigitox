class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
end
