class AlterListingsAddUserIdColumn < ActiveRecord::Migration[5.2]
  def change
  	add_column :listings, :user_id, :integer
  	add_index :listings, :user_id
  end
end
