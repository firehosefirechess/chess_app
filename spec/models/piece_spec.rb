require 'rails_helper'

RSpec.describe Piece, type: :model do
  let(:piece) { FactoryGirl.build :piece }

  it 'is not valid without a color and type' do
    expect(piece).not_to be_valid
  end
end
