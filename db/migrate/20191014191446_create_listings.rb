class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
    #2019-10-14: Create table columns for user entries
      t.string :name
      t.text :description
      t.string :address	
      t.timestamps
    end
  end
end
