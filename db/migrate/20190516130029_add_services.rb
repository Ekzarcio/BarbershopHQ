class AddServices < ActiveRecord::Migration[5.2]
  def change
  	Service.create :name => 'haircut', :description => 'this is haircut only', :price => 1800, :with_massage => true, :path_to_image => '/images/haircut.jpg' 
  	Service.create :name => 'shaving', :description => "king's shaving", :price => 1000, :with_massage => false, :path_to_image => '/images/shaving.jpg' 
  	Service.create :name => 'coloring', :description => 'professional coloring', :price => 1200, :with_massage => false, :path_to_image => '/images/coloring.jpg' 
  end
end
