require 'rails_helper'

RSpec.describe Knight, type: :model do
  let(:pawn) { FactoryGirl.build :pawn }
  it 'is a Piece type' do
    expect(pawn).to be_a_kind_of(Piece)
  end
end
