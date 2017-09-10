class Piece < ApplicationRecord
  # belongs_to :player # no player model yet
  # rubocop:disable Metrics/AbcSize
  belongs_to :game
  validates :color, presence: true
  validates :type, presence: true

  scope :white, ->() { where(color: 'white') }
  scope :black, ->() { where(color: 'black') }

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


  def vertical_obstruction?(destination_y)
    range = self.y_position < destination_y ? (self.y_position..destination_y) : (destination_y..self.y_position)
    game.pieces.where(
        color: self.color,
        x_position: self.x_position,
        y_position: range
      ).where.not(id: self.id).any?
  end

  def horizontal_obstruction?(destination_x)
    range = self.x_position < destination_x ? (self.x_position..destination_x) : (destination_x..self.x_position)
    game.pieces.where(
        color: self.color,
        x_position: range,
        y_position: self.y_position
      ).where.not(id: self.id).any?
  end

  def diagonal_obstruction?(destination_x, destination_y)
    x_range = self.x_position < destination_x ? (self.x_position..destination_x) : (destination_x..self.x_position)
    y_range = self.y_position < destination_y ? (self.y_position..destination_y) : (destination_y..self.y_position)
    game.pieces.where(
      color: self.color,
      x_position: x_range,
      y_position: y_range
    ).where.not(id: self.id).any?
  end
end
