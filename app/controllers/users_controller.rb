class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all.by_name
  end

  def show
  end

# Commented out is taken care of by devise.
  # def new
  #   @user = User.new
  # end
  #
  # def create # would be useful for admin tools
  #   user = User.new(user_params)
  #   binding.pry
  #   if user.save
  #     redirect_to users_path
  #   else
  #     render 'new'
  #   end
  # end

  # def edit
  # end

  # def update
  #   if @user.update(user_params)
  #     redirect_to users_path
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  #   @user.destroy
  #   redirect_to root_path
  # end

  private

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :description, :email, :password) #devise is requiring email and password FYI!
  # end

  def find_user
    @user = User.find(params[:id])
  end
end
