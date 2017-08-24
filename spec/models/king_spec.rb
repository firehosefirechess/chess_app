require 'rails_helper'

RSpec.describe King, type: :model do
  let(:king) { FactoryGirl.build :king }
  it 'is a Piece type' do
    expect(king).to be_a_kind_of(Piece)
  end
  # it 'should move up, down, diagonal 1 squares' do
  # end
  #
  # it 'should captures units vertically, horizontally, and diagonally' do
  # end
end
