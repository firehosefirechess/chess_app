require 'rails_helper'
RSpec.describe Game, type: :model do
  it 'has valid factory' do
    expect(FactoryGirl.build(:game)).to be_valid
  end
end
