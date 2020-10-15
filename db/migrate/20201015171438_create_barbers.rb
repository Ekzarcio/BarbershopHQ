class CreateBarbers < ActiveRecord::Migration[6.0]
  def change
  	create_table :barbers do |t|
  		t.text :name
  		t.timestamps
  	end

  	Barber.create :name => 'Jessy'
  	Barber.create :name => 'Walt'
  	Barber.create :name => 'Mike'

  end
end
