class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :message
      t.string :rating
      t.integer :user_id
      t.integer :listing_id
      t.timestamps
  end

   	add_index :comments, [:user_id, :listing_id]
    add_index :comments, :listing_id
  end
end
