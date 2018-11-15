class PagesController < ApplicationController
  # layout "pages_layout", except: :dashboard
  layout "pages_layout", except: :dashboard
  # before_action :authenticate_user!, only: :dashboard
  skip_after_action :verify_authorized
  def index
  end
end
