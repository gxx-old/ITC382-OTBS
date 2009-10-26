class Address < ActiveRecord::Base
  validates_presence_of :address, :type_of_building, :postcode, :city, :state
  validates_length_of :address, :within => 10..100, :allow_blank => true
  validates_inclusion_of :type_of_building, :in => %w( unit flat house battle-axe ), :allow_blank => true
  validates_length_of :postcode, :is => 4,     :allow_blank => true
  validates_numericality_of :postcode,         :allow_blank => true
  validates_length_of :city, :within => 3..50, :allow_blank => true
  validates_inclusion_of :state, :in => %w( NSW VIC TAS QLD ACT NT WA SA ), :message => "invalid state"

  attr_accessible :address, :type_of_building, :postcode, :city, :state
end