require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'attributes' do
      it { should respond_to :first_name }
      it { should respond_to :last_name}
      it { should respond_to :description}
      it { should respond_to :email}
      it { should respond_to :password}
  end

  it 'sorts users by first name' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, :spanish)
    users = User.by_name
    expect(users[0].first_name).to eq("Juan")
    expect(users[1].first_name).to eq("Mike")

  end
end
