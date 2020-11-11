class AddAddressToCrafts < ActiveRecord::Migration[6.0]
  def change
    add_column :crafts, :address, :string
  end
end
