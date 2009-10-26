class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :null => false, :unique => true
      t.string :email, :null => false, :unique => true
      t.string :crypted_password, :limit => 40, :null => false
      t.string :salt,             :limit => 40, :null => false
      t.string :remember_token
      t.datetime :remember_token_expires_at
      t.string :activation_code,  :limit => 40
      t.datetime :activated_at
      t.string :state, :null => false, :default => 'passive'
      t.integer :discount, :default => 0
      t.timestamps
      t.datetime :deleted_at
    end
  end

  def self.down
    drop_table :users
  end
end
