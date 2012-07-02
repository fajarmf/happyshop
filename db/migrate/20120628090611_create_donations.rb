class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.date :pickup_date
      t.text :description
      t.integer :percentage
      t.integer :status, :default => 0
      t.text :address
      t.timestamps
    end
    add_index :donations, :user_id
    add_column :donations, :image_file_name, :string
    add_column :donations, :image_content_type, :string
    add_column :donations, :image_file_size, :integer
    add_column :donations, :image_updated_at, :datetime
  end
end
