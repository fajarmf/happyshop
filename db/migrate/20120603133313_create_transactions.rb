class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :status
      t.integer :type
      t.float :amount
      t.integer :buyer_user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
