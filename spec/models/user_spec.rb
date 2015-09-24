require 'rails_helper'

RSpec.describe User, type: :model do

  it 'sorts users by first name' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, :spanish)
    users = User.order_name
    expect(users[0].first_name).to eq("Juan")
    expect(users[1].first_name).to eq("Mike")

  end
end
