
class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  #   before_action :authenticate_user!
#   before_action :set_user, only: [:show, :edit, :update, :destroy]
#   # after_action :verify_authorized

  
  # # GET /admin/users
  # # GET /admin/users.json
  # def index
  #   @users = User.all
  #   authorize User
  # end

  # # GET /admin/users/1
  # # GET /admin/users/1.json
  # def show
  #   @user = User.find(params[:id])
  #   authorize @user
  # end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
