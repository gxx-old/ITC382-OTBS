class CreateCreditCards < ActiveRecord::Migration
  def self.up
    create_table :credit_cards do |t|
      t.string :name
      t.string :cardnumber
      t.string :expirydatemonth
      t.string :expirydateyear
      t.string :csc
      t.string :cardtype

      t.timestamps
    end
  end

  def self.down
    drop_table :credit_cards
  end
end
