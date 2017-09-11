class Piece < ApplicationRecord
  # belongs_to :player # no player model yet
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
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

  def obstructed?(dest_row, dest_col)
    if dest_row == self.x_position
      horizontal_obstruction?
    elsif dest_col == self.y_position
      vertical_obstruction?
    elsif (dest_row - self.x_position).abs == (dest_col - self.y_position).abs
      diagonal_obstruction?
    else
      'Invalid input'
    end
  end

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
    range = self.y_position < destination_y ? (self.y_position...destination_y) : (destination_y...self.y_position)
    game.pieces.where(
        # color: self.color,
        x_position: self.x_position,
        y_position: range
      ).where.not(id: self.id).any?
  end

  def horizontal_obstruction?(destination_x)
    range = self.x_position < destination_x ? (self.x_position...destination_x) : (destination_x...self.x_position)
    game.pieces.where(
        # color: self.color,
        x_position: range,
        y_position: self.y_position
      ).where.not(id: self.id).any?
  end

  def diagonal_obstruction?(destination_x, destination_y)
    x_range = self.x_position < destination_x ? (self.x_position...destination_x) : (destination_x...self.x_position)
    y_range = self.y_position < destination_y ? (self.y_position...destination_y) : (destination_y...self.y_position)
    x_array = x_range.first(x_range.size)
    y_array = y_range.first(y_range.size)

    coordinates = x_array.each_with_index.map do |x, index|
      { x: x, y: y_array[index] }
    end

    obstructions = coordinates.select do |coordinate|
      game.pieces.where(
        # color: self.color,
        x_position: coordinate[:x],
        y_position: coordinate[:y]
      ).where.not(id: self.id).any?
    end
    obstructions.any?
  end
end
