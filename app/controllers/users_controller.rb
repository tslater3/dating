class UsersController < ApplicationController

  # before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.by_name
    # @users_females = User.where(gender: 'female').females_only
    # @users_males = User.where(gender: 'male').males_only
  end

  def vote
    User.increment_counter(:votes, params[:id])
      redirect_to user_path(id: params[:id])
  end

  def unvote
    User.decrement_counter(:votes, params[:id])
    redirect_to user_path(id: params[:id])
  end



  def show
    @user = User.find(params[:id])
    @interests = Interest.where(user_id: params[:id])
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
