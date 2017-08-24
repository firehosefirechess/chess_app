require 'rails_helper'

RSpec.describe Rook, type: :model do
  let(:rook) { FactoryGirl.build :rook }

  it 'is a Piece type' do
    expect(rook).to be_a_kind_of(Piece)
  end
  # it 'should move diagonally' do
  # end

  # it 'should captures units diagonally' do
  # end
end
