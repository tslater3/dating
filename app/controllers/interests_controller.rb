class InterestsController < ApplicationController
  
  def index
    @interests = Interest.where(user_id: params[:user_id])
  end

  def new
    @interest = Interest.new(user_id: params[:user_id])
  end

  def create
    @interest = Interest.new(interest_params)
    if @interest.save
      redirect_to user_interests_path(user_id: params[:user_id])
    else
      render 'new'
    end
  end

  def edit
    @interest = Interest.find(params[:id])
  end

  def update
    @interest = Interest.find(params[:id])
    if @interest.update(interest_params)
      redirect_to user_interests_path(user_id: params[:user_id])
    else
      render 'edit'
    end
  end

  private

  def interest_params
    params.require(:interest).permit(:profession, :hobbies, :kids, :party, :user_id)
  end


end
