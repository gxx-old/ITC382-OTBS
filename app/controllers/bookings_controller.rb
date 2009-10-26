class BookingsController < ApplicationController
  before_filter :login_required
  before_filter :get_authorized_booking, :only => [:show, :edit, :update, :destroy]
  before_filter :check_time_editable, :only => [:edit, :update, :destroy]
  #verify :method => :post, :only => [:cancelbooking], :redirect_to => { :action => :index }

  def index
    @bookings = current_user.bookings

    respond_to do |format|
      format.html
      format.xml  { render :xml => @bookings }
    end
  end

  def show
    print 'in show'
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.xml
  def new
    @booking     = Booking.new
    @pick_up     = @booking.build_pick_up
    @destination = @booking.build_destination
    @credit_card = @booking.build_credit_card

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @booking }
    end
  end

  def edit
  end

  def create
    @booking = Booking.new(params[:booking])
    @pick_up     = @booking.build_pick_up(params[:pick_up])
    @destination = @booking.build_destination(params[:destination])
    @credit_card = @booking.build_credit_card(params[:credit_card])
    @booking.taxi_type = TaxiType.find(params[:taxi_type][:id])
    @booking.user = current_user
    respond_to do |format|
      if @booking.save
        flash[:notice] = 'Booking was successfully created.'
        format.html { redirect_to @booking }
        format.xml  { render :xml => @booking, :status => :created, :location => @booking }
      else
        @pick_up.errors.each     { |attr, msg| @booking.errors.add('Pick Up '     + attr, msg) }
        @destination.errors.each { |attr, msg| @booking.errors.add('Destination ' + attr, msg) }
        @credit_card.errors.each { |attr, msg| @booking.errors.add(attr, msg) }
        format.html { render :action => :new }
        format.xml  { render :xml => @booking.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.pick_up.update_attributes(params[:pickup]) and
          @booking.destination.update_attributes(params[:destination]) and
          @booking.credit_card.update_attributes(params[:credit_card]) and
          @booking.taxi_type = TaxiType.find(params[:taxi_type][:id]) and
          @booking.update_attributes(params[:booking])
        flash[:notice] = 'Booking was successfully updated.'
        format.html { redirect_to @booking }
        format.xml  { head :ok }
      else
        @booking.pick_up.errors.each     { |attr, msg| @booking.errors.add('Pick Up '     + attr, msg) }
        @booking.destination.errors.each { |attr, msg| @booking.errors.add('Destination ' + attr, msg) }
        @booking.credit_card.errors.each { |attr, msg| @booking.errors.add(attr, msg) }
        format.html { render :action => :edit }
        format.xml  { render :xml => @booking.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to(bookings_url) }
      format.xml  { head :ok }
    end
  end

  def editable
    @bookings = Booking.find_by_user_id_and_id(current_user.id, params[:id], :conditions => ["time > ?", Time.now + 20.minutes])

    respond_to do |format|
      format.html { render :action => :index }
      format.xml  { render :xml => @bookings }
    end
  end

  private

    def get_authorized_booking
      raise ActiveRecord::RecordNotFound unless @booking = Booking.find_by_user_id_and_id(current_user.id, params[:id])
    end

    def check_time_editable
      raise Booking::NotEditable unless @booking.time > Time.now + 15.minutes
    end
end
