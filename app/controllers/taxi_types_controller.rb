class TaxiTypesController < ApplicationController
  def index
    @taxi_types = TaxiType.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @taxi_types }
    end
  end

  def show
    @taxi_type = TaxiType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @taxi_type }
    end
  end
end
