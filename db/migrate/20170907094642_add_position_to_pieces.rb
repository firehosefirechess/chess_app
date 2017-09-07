class AddPositionToPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :x_position, :integer
    add_column :pieces, :y_position, :integer
  end
end
