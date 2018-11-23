class DashboardController < ApplicationController
  before_action :authenticate_user!, only: :show
  skip_after_action :verify_authorized
  def show
    flash[:notice] = "You're one sexy beast!"
  end
end