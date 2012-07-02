class CreateDropboxes < ActiveRecord::Migration
  def change
    create_table :dropboxes do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
