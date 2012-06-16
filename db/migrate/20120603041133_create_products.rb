class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :description
      t.integer :vendor_user_id
      t.boolean :sell

      t.timestamps
    end
  end
end
