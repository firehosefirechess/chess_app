require 'rails_helper'

RSpec.describe Queen, type: :model do
  let(:queen) { FactoryGirl.build :queen }
  it 'is a Piece type' do
    expect(queen).to be_a_kind_of(Piece)
  end
  # it 'should move vertically, horizontally, and diagonally' do
  # end
  #
  # it 'should captures units vertically, horizontally, and diagonally' do
  # end
end
