require 'rails_helper'

RSpec.describe Knight, type: :model do
  let(:knight) { FactoryGirl.build :knight }

  it 'is a Piece type' do
    expect(knight).to be_a_kind_of(Piece)
  end
  # it 'should move' do
  # end
  #
  # it 'should capture units' do
  # end
end
