class PagesController < ApplicationController
  layout "pages_layout", except: :dashboard
  # before_action :authenticate_user!, only: :dashboard
  skip_after_action :verify_authorized
  def index
    flash[:notice] = "This is a notice" 
   flash[:alert] = "This is an alert" 
   flash[:warning] = "This is an warning" 
   flash[:error] = "This is an error" 
   flash[:success] = "This is an success" 
  end
end