class InterestsController < ApplicationController
  
  # def index
  #   @interests = Interest.where(user_id: params[:user_id])
  #   @interest = Interest.find(params[:id])
  # end

  def new
    @user = User.find(params[:user_id])
    @interest = @user.interests.new
    # @interest = Interest.new(user_id: params[:user_id])
  end
  # def new
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.new
  # end

  def create
    # @interest = Interest.new(interest_params)
    @user = User.find(params[:user_id])
    @interest = Interest.new(params[:id])
    if @interest.save
      redirect_to user_path(@user)
      # redirect_to user_interests_path(user_id: params[:user_id])
    else
      render :new
    end
  end
  # def create
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.new(params[:id])
  #   if @comment.save
  #     redirect_to post_path(@post)
  #   else
  #     render :new
  #   end
  # end

  def edit
    @user = User.find(params[:id])
    @interest = Interest.find(params[:user_id])
  end
  # def edit
  #   @post = Post.find(params[:id])
  #   @comment = Comment.find(params[:post_id])
  # end

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
  # def update
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.find(params[:id])
  #   if @comment.update(comment_params)
  #     redirect_to post_path(@post)
  #   else
  #     render :edit
  #   end
  # end

  private

  def interest_params
    params.require(:interest).permit(:profession, :hobbies, :kids, :party, :user_id)
  end
  # def comment_params
  #   params.require(:comment).permit(:post_id, :name, :body)
  # end

end
