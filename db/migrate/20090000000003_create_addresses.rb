class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :address, :null => false
      t.string :type_of_building, :null => false
      t.string :postcode, :null => false
      t.string :city, :null => false
      t.string :state, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
