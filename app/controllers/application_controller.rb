# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout 'sitelayout'
  filter_parameter_logging :password
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from User::NotAuthorized,          :with => :user_not_authorized
  rescue_from Booking::NotEditable,         :with => :booking_not_editable

  def record_not_found
    render :file => 'record_not_found.html.erb',     :layout => 'sitelayout', :status => 404
  end

  def user_not_authorized
    render :file => '401.html.erb',                  :layout => 'sitelayout', :status => 401
  end
  
  def booking_not_editable
    render :file => 'booking_not_editable.html.erb', :layout => 'sitelayout'
  end

end
