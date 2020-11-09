class CreateCrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :crafts do |t|
      t.string :name
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
