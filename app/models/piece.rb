class Piece < ApplicationRecord
  # belongs_to :player # no player model yet
  belongs_to :game
  validates :color, presence: true
  validates :type, presence: true
  # def color
  # end
  #
  # def move(row,col)
  # end
  #
  # def is_obstructed?(dest_row, dest_col)
  # end

  # def horizontal_move(x,y)
  # end
  #
  # def vertical_move(x,y)
  # end
  #
  # def diagonal_move(x,y)
  # end

  # def capture(x,y)
  # end
end
