class AddTagstoListings < ActiveRecord::Migration[5.2]
  def change
  	add_column :listings, :tags, :text
  end
end
