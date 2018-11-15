# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.

module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin

    def authenticate_admin
      user_not_authorized unless current_user.present? && current_user.admin?
    end

    def user_not_authorized
      flash[:alert] = 'You are not authorized. These are NOT the drones you are looking for.'
      redirect_to(request.referer || root_path)
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    def records_per_page
      params[:per_page] || 40
    end
  end
end
