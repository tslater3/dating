class InterestsController < ApplicationController
  
  # def index
  #   @interests = Interest.where(user_id: params[:user_id])
  #   @interest = Interest.find(params[:id])
  # end

  def new
    @user = User.find(params[:user_id])
    # @interest = @user.interests.new
    @interest = Interest.new(user_id: params[:user_id])
  end
  # def new
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.new
  # end

  def create
    @interest = Interest.new(interest_params)
    @user = User.find(params[:user_id])
    # @interest = Interest.new(params[:id])
    if @interest.save
      redirect_to user_path(@user)
      # redirect_to user_interests_path(user_id: params[:user_id])
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @interest = Interest.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    @interest = Interest.find(params[:id])
    if @interest.update(interest_params)
      redirect_to user_path(@user)
      # redirect_to user_interests_path(user_id: params[:user_id])
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user)
    @interest = Interest.find(params[:id])
    if @interest.destroy
      redirect_to root_path
    else
      redirect_to user_path(@user)
    end
  end

  private

  def interest_params
    params.require(:interest).permit(:profession, :hobbies, :kids, :party, :user_id)
  end
  # def comment_params
  #   params.require(:comment).permit(:post_id, :name, :body)
  # end

end
