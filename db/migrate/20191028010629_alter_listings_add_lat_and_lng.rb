class AlterListingsAddLatAndLng < ActiveRecord::Migration[5.2]
  def change
  	add_column :listings, :latitude, :float
    add_column :listings, :longitude, :float
  end
end
