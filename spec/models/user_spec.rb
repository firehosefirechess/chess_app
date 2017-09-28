require 'rails_helper'
RSpec.describe User, type: :model do
  it "should be able to create a player with factory_girl" do
    user = FactoryGirl.create :user
    expect(user).to be_a(User)
  end
end
