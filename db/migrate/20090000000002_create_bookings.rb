class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.datetime :time, :null => false
      t.references :destination, :default => nil
      t.references :pick_up, :null => false
      t.references :user, :null => false
      t.references :taxi_type, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
