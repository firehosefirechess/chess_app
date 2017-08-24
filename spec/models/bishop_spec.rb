require 'rails_helper'

RSpec.describe Bishop, type: :model do
  let(:bishop) { FactoryGirl.build :bishop }
  it 'is a Piece type' do
    expect(bishop).to be_a_kind_of(Piece)
  end
  # it 'should move vertically or horizontally' do
  # end
  #
  # it 'should captures units vertically or horizontally' do
  # end
end
