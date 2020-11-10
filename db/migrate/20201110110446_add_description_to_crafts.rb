class AddDescriptionToCrafts < ActiveRecord::Migration[6.0]
  def change
    add_column :crafts, :description, :text
  end
end
