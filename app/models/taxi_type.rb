class TaxiType < ActiveRecord::Base
  has_many :bookings

  validates_presence_of :taxitype, :price_per_kilometer, :price_per_minute, :flag_fee
  validates_length_of :taxitype, :maximum => 100, :allow_blank => true
  validates_numericality_of :price_per_kilometer, :price_per_minute, :flag_fee, :allow_blank => true
  validates_uniqueness_of :taxitype, :allow_blank => true
  
  attr_accessible :type, :price_per_kilometer, :price_per_minute, :flag_fee
end
