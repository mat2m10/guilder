class AddCoordinatesToCrafts < ActiveRecord::Migration[6.0]
  def change
    add_column :crafts, :latitude, :float
    add_column :crafts, :longitude, :float
  end
end
