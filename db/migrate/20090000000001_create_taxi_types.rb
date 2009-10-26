class CreateTaxiTypes < ActiveRecord::Migration
  def self.up
    create_table :taxi_types do |t|
      t.string  :taxitype, :null => false, :unique => true
      t.integer :price_per_kilometer, :null => false
      t.integer :price_per_minute, :null => false
      t.integer :flag_fee, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :taxi_types
  end
end
