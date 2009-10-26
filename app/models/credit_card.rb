class CreditCard < ActiveRecord::Base
  has_one :booking

  validates_presence_of :name, :cardnumber, :expirydatemonth, :expirydateyear, :csc
  validates_length_of :cardnumber, :is => 16,   :allow_blank => true
  validates_length_of :csc,        :is => 3,    :allow_blank => true
  validates_length_of :name, :within => 5..100, :allow_blank => true
  validates_numericality_of :cardnumber, :csc,  :allow_blank => true
  validates_inclusion_of :expirydatemonth, :in => %w( 01 02 03 04 05 06 07 08 09 10 11 12 ), :message => "invalid card month", :allow_blank => true
  validates_inclusion_of :expirydateyear,  :in => %w( 09 10 11 12 ), :message => "invalid card year",                          :allow_blank => true
  validates_inclusion_of :cardtype,        :in => %w( visa mastercard ), :message => "invalid card type",                      :allow_blank => true

  attr_accessible :name, :cardnumber, :expirydatemonth, :expirydateyear, :csc
end