class UsersController < ApplicationController
  # before_action :find_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all.by_name
  end

  def show
    @user = User.find(params[:id])
    @interests = Interest.where(user_id: params[:id])
  end

  def profile
    @user = User.find(current_user)
    # @user = User.find(params[:id])
    # @interests = Interest.where(user_id: params[:id])
    @interests = Interest.where(user_id: current_user)
  end

  private

  # Not sure if below should be commented out or not!!!!
  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :password) #devise is requiring email and password FYI!
  end

  # def find_user
  #   @user = User.find(params[:id])
  # end
end
