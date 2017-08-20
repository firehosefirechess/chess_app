class Piece < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  def color
  end

  def move(row,col)
  end

  def is_obstructed?(dest_row, dest_col)
  end

  # def horizontal_move(x,y)
  # end
  #
  # def vertical_move(x,y)
  # end
  #
  # def diagonal_move(x,y)
  # end

  def capture(x,y)
  end


end
