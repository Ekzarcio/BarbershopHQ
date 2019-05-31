class CreateServices < ActiveRecord::Migration[5.2]
  def change
  	create_table :services do |t|
  		t.text :name
  		t.text :description
  		t.decimal :price
  		t.boolean :with_massage
  		t.string :path_to_image
  		t.timestamps
  	end
  end
end
