class PagesController < ApplicationController
  layout "pages_layout", except: :dashboard
  skip_after_action :verify_authorized
  def index
  end
end