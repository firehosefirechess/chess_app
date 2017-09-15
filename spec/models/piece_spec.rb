require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe '#is_obstructed?' do
    describe '#vertical_obstruction?' do
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
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, x_position: 3, y_position: 5 }

          it 'is not ok to move' do
            expect(piece.vertical_obstruction?(6)).to eq true
          end
        end

        context 'when the destination is below me and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: piece.color, x_position: 3, y_position: 2 }

          it 'is not ok to move when there is nothing there' do
            expect(piece.vertical_obstruction?(1)).to eq true
          end
        end
      end

      context 'when there is a piece of oposite color in the way' do
        let(:game) { FactoryGirl.create :game }
        let(:piece) { FactoryGirl.create :piece, game: game,  x_position: 3, y_position: 4 }

        context 'when the destination is above me and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: 'black', x_position: 3, y_position: 4 }

          it 'is not ok to move when there is piece of oposite color there' do
            expect(piece.vertical_obstruction?(5)).to eq true
          end
        end

        context 'when the destination is below me and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: 'black', x_position: 3, y_position: 2 }

          it 'is not ok to move when there is piece of oposite color there' do
            expect(piece.vertical_obstruction?(1)).to eq true
          end
        end
      end
    end

    describe '#horizontal_obstruction?' do
      context 'when the destination is above me' do
        let(:piece) { FactoryGirl.create :piece, x_position: 3, y_position: 3 }

        it 'is ok to move when there is nothing there' do
          expect(piece.horizontal_obstruction?(5)).to eq false
        end
      end

      context 'when the destination is below me' do
        let(:piece) { FactoryGirl.create :piece, x_position: 3, y_position: 3 }

        it 'is ok to move when there is nothing there' do
          expect(piece.horizontal_obstruction?(1)).to eq false
        end
      end

      context 'when the destination is me' do
        let(:piece) { FactoryGirl.create :piece, x_position: 3, y_position: 3 }

        it 'is ok to move when there is nothing there' do
          expect(piece.horizontal_obstruction?(3)).to eq false
        end
      end

      context 'for every square below us' do
        let(:piece) { FactoryGirl.create :piece, x_position: 3, y_position: 8 }

        it 'is ok to move when there is nothing there' do
          (1..7).each do |x|
            expect(piece.horizontal_obstruction?(x)).to eq false
          end
        end
      end

      context 'for every square above us' do
        let(:piece) { FactoryGirl.build :piece, x_position: 3, y_position: 1 }

        it 'is ok to move when there is nothing there' do
          (2..8).each do |x|
            expect(piece.horizontal_obstruction?(x)).to eq false
          end
        end
      end

      context 'when there is a piece of mine in the way' do
        let(:game) { FactoryGirl.create :game }
        let(:piece) { FactoryGirl.create :piece, game: game,  x_position: 3, y_position: 4 }

        context 'when the destination is right of me and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, x_position: 4, y_position: 4 }

          it 'is not ok to move' do
            expect(piece.horizontal_obstruction?(5)).to eq true
          end
        end

        context 'when the destination is left of me and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: piece.color, x_position: 2, y_position: 4 }

          it 'is not ok to move when there is nothing there' do
            expect(piece.horizontal_obstruction?(1)).to eq true
          end
        end
      end

      context 'when there is a piece of oposite color in the way' do
        let(:game) { FactoryGirl.create :game }
        let(:piece) { FactoryGirl.create :piece, game: game,  x_position: 3, y_position: 4 }

        context 'when the destination is above me and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: 'black', x_position: 3, y_position: 4 }

          it 'is not ok to move when there is piece of oposite color there' do
            expect(piece.horizontal_obstruction?(5)).to eq true
          end
        end

        context 'when the destination is below me and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: 'black', x_position: 3, y_position: 2 }

          it 'is not ok to move when there is piece of oposite color there' do
            expect(piece.horizontal_obstruction?(1)).to eq false
          end
        end
      end
    end

    describe '#diagonal_obstruction?' do
      context 'when the destination is up and on the right' do
        let(:piece) { FactoryGirl.create :piece, x_position: 4, y_position: 4 }

        it 'is ok to move when there is nothing there' do
          expect(piece.diagonal_obstruction?(6, 6)).to eq false
        end
      end

      context 'when the destination is up and on the left' do
        let(:piece) { FactoryGirl.create :piece, x_position: 4, y_position: 4 }

        it 'is ok to move when there is nothing there' do
          expect(piece.diagonal_obstruction?(2, 6)).to eq false
        end
      end

      context 'when the destination is down and on the right' do
        let(:piece) { FactoryGirl.create :piece, x_position: 4, y_position: 4 }

        it 'is ok to move when there is nothing there' do
          expect(piece.diagonal_obstruction?(6, 2)).to eq false
        end
      end

      context 'when the destination is down and on the left' do
        let(:piece) { FactoryGirl.create :piece, x_position: 4, y_position: 4 }

        it 'is ok to move when there is nothing there' do
          expect(piece.diagonal_obstruction?(2, 2)).to eq false
        end
      end

      context 'when the destination is me' do
        let(:piece) { FactoryGirl.create :piece, x_position: 4, y_position: 4 }

        it 'is ok to move when there is nothing there' do
          expect(piece.diagonal_obstruction?(4, 4)).to eq false
        end
      end

      context 'for every square below us' do
        let(:piece) { FactoryGirl.create :piece, x_position: 4, y_position: 8 }

        it 'is ok to move when there is nothing there' do
          (1..8).each do |x|
            (1..7).each do |y|
              expect(piece.diagonal_obstruction?(x, y)).to eq false
            end
          end
        end
      end

      context 'for every square above us' do
        let(:piece) { FactoryGirl.create :piece, x_position: 4, y_position: 1 }

        it 'is ok to move when there is nothing there' do
          (1..8).each do |x|
            (2..8).each do |y|
              expect(piece.diagonal_obstruction?(x, y)).to eq false
            end
          end
        end
      end

      context 'when there is a piece of mine in the way' do
        let(:game) { FactoryGirl.create :game }
        let(:piece) { FactoryGirl.create :piece, game: game, x_position: 4, y_position: 4 }

        context 'when the destination is up and on the right, and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, x_position: 5, y_position: 5 }

          it 'is not ok to move' do
            expect(piece.diagonal_obstruction?(6, 6)).to eq true
          end
        end

        context 'when the destination is up and on the left, and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, x_position: 3, y_position: 5 }

          it 'is not ok to move' do
            expect(piece.diagonal_obstruction?(2, 6)).to eq true
          end
        end

        context 'when the destination is down and on the right, and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: piece.color, x_position: 5, y_position: 3 }

          it 'is not ok to move when there is nothing there' do
            expect(piece.diagonal_obstruction?(6, 2)).to eq true
          end
        end

        context 'when the destination is down and on the left, and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: piece.color, x_position: 3, y_position: 3 }

          it 'is not ok to move when there is nothing there' do
            expect(piece.diagonal_obstruction?(2, 2)).to eq true
          end
        end
      end

      context 'when there is a piece of opposite color in the way' do
        let(:game) { FactoryGirl.create :game }
        let(:piece) { FactoryGirl.create :piece, game: game, x_position: 4, y_position: 4 }

        context 'when the destination is up and on the right, and there is piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: 'black', x_position: 5, y_position: 5 }

          it 'is not ok to move when there is a piece of opposite color there' do
            expect(piece.diagonal_obstruction?(6, 6)).to eq true
          end
        end

        context 'when the destination is up and on the left, and there is piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: 'black', x_position: 3, y_position: 5 }

          it 'is not ok to move when there is a piece of opposite color there' do
            expect(piece.diagonal_obstruction?(2, 6)).to eq true
          end
        end

        context 'when the destination is down and on the right, and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: 'black', x_position: 5, y_position: 3 }

          it 'is not ok to move when there is a piece of opposite color there' do
            expect(piece.diagonal_obstruction?(6, 2)).to eq true
          end
        end

        context 'when the destination is down and on the left, and there is a piece in the way' do
          let!(:obstructing_piece) { FactoryGirl.create :piece, game: game, color: 'black', x_position: 3, y_position: 3 }

          it 'is not ok to move when there is a piece of opposite color there' do
            expect(piece.diagonal_obstruction?(2, 2)).to eq true
          end
        end
      end
    end

    describe '#invalid input' do
      context 'when the destination is up and on the left, and the piece is not moving horizontally, vertically, or horizontally' do
        let(:piece) { FactoryGirl.create :piece, x_position: 4, y_position: 4 }

        it 'will raise an error' do
          expect(piece.obstructed?(2, 5)). to eq 'Invalid input'
        end
      end

      context 'when the destination is up and on the right, and the piece is not moving horizontally, vertically, or horizontally' do
        let(:piece) { FactoryGirl.create :piece, x_position: 4, y_position: 4 }

        it 'will raise an error' do
          expect(piece.obstructed?(5, 6)). to eq 'Invalid input'
        end
      end

      context 'when the destination is down and on the left, and the piece is not moving horizontally, vertically, or horizontally' do
        let(:piece) { FactoryGirl.create :piece, x_position: 4, y_position: 4 }

        it 'will raise an error' do
          expect(piece.obstructed?(3, 2)). to eq 'Invalid input'
        end
      end

      context 'when the destination is down and on the right, and the piece is not moving horizontally, vertically, or horizontally' do
        let(:piece) { FactoryGirl.create :piece, x_position: 4, y_position: 4 }

        it 'will raise an error' do
          expect(piece.obstructed?(6, 3)). to eq 'Invalid input'
        end
      end
    end
  end
end
