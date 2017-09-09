require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe '#vertical_obstruction' do
    context 'when the destination is above me' do
      let(:piece) { FactoryGirl.create :piece, x_position: 3, y_position: 3 }

      it 'is ok to move when there is nothing there' do
        expect(piece.vertical_obstruction?(5)).to eq false
      end
    end

    context 'when the destination is below me' do
      let(:piece) { FactoryGirl.create :piece, x_position: 3, y_position: 3 }

      it 'is ok to move when there is nothing there' do
        expect(piece.vertical_obstruction?(1)).to eq false
      end
    end

    context 'when the destination is me' do
      let(:piece) { FactoryGirl.create :piece, x_position: 3, y_position: 3 }

      it 'is ok to move when there is nothing there' do
        expect(piece.vertical_obstruction?(3)).to eq false
      end
    end

    context 'for every square below us' do
      let(:piece) { FactoryGirl.create :piece, x_position: 3, y_position: 8 }

      it 'is ok to move when there is nothing there' do
        (1..7).each do |y|
          expect(piece.vertical_obstruction?(y)).to eq false
        end
      end
    end

    context 'for every square above us' do
      let(:piece) { FactoryGirl.build :piece, x_position: 3, y_position: 1 }

      it 'is ok to move when there is nothing there' do
        (2..8).each do |y|
          expect(piece.vertical_obstruction?(y)).to eq false
        end
      end
    end

    context 'when there is a piece of mine in the way' do
      let(:game) { FactoryGirl.create :game }
      let(:piece) { FactoryGirl.create :piece, game: game,  x_position: 3, y_position: 4 }

      context 'when the destination is above me and there is a piece in the way' do
        let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, x_position: 3, y_position: 4 }

        it 'is not ok to move' do
          expect(piece.vertical_obstruction?(5)).to eq true
        end
      end

      context 'when the destination is below me and there is a piece in the way' do
        let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: piece.color, x_position: 3, y_position: 2 }

        it 'is not ok to move when there is nothing there' do
          expect(piece.vertical_obstruction?(1)).to eq true
        end
      end
    end
  end
end
