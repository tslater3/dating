require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user){FactoryGirl.create(:user)}

  before(:each) do
    sign_in user
  end

  # current_user

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: user.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: user.id}
      expect(response).to have_http_status(:success)
    end
  end

  # describe "POST #create" do

  #   it "creates a user" do
  #     # expect(User.count).to eq(0)
  #     post :create, user
  #     expect(User.count).to eq(2)
  #     # expect(User.last.first_name).to eq(first_name)
  #   end

  #   # it "renders new if can't create" do

  #   # end

  # end

end
