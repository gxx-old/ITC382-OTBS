class Booking < ActiveRecord::Base
  belongs_to :taxi_type
  belongs_to :user
  belongs_to :destination, :class_name => 'Address'
  belongs_to :pick_up,     :class_name => 'Address'
  belongs_to :credit_card

  validates_presence_of :time
  validates_associated :taxi_type, :user, :destination, :pick_up, :credit_card

  attr_accessible :time

  class NotEditable < Exception; end
end
