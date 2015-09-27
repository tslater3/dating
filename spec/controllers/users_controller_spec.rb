require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user){FactoryGirl.create(:user)}
  # let(:spanish){FactoryGirl.create(:user, trait :spanish)}
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

  describe 'PUT #update' do
    it 'updates a user' do
      user
      put :update, {id: user.id, user: {first_name: 'Trevor', last_name: 'Slater', description: 'blah blah', email: 'jkadf@gmail.com', password: 'password'}}
      user.reload
      expect(user.first_name).to eq('Trevor')
    end

    it 'does not update user without first name' do
      user
      put :update, {id: user.id, user: {first_name: nil, last_name: 'Slater', description: 'blah blah', email: 'jkadf@gmail.com', password: 'password'}}
      user.reload
      expect(user.first_name).to eq('Mike')
    end

    it 'renders edit form again on error' do
      user
      put :update, {id: user.id, user: {first_name: nil, last_name: 'Slater', description: 'blah blah', email: 'jkadf@gmail.com', password: 'password'}}
      user.reload
      expect(response).to render_template('edit')
    end
  end

  describe 'DELETE :destroy' do
    it 'deletes a user' do
      user
      delete :destroy, {id: user.id}
      expect(User.count).to eq(0)
    end
  end

  describe 'GET #vote' do
    it 'adds to vote' do
      get :vote, {id: user.id}
      expect(User.first.votes).to eq(1)
    end

    it 'subtracts from vote' do
      get :unvote, {id: user.id}
      expect(User.first.votes).to eq(-1)
    end


  end


  # describe "POST #create" do

    # it "creates a user" do
    #   # expect(User.count).to eq(0)
    #   expect(User.count).to eq(1)
    #   post :create, {user: {first_name: 'Trevor', last_name: 'Slater', description: 'blah blah', email: "ldkd@kdajf.com", password: 'password'}}
    #   expect(User.count).to eq(2)
    #   # expect(User.last.first_name).to eq(first_name)
    # end
  # end
    # it "renders new if can't create" do

    # end

  # end

end
