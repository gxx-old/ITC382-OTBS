class IndexController < ApplicationController
  def index
  end

  def about
  end

  def error
    render :file => '404.html.erb', :layout => 'sitelayout', :status => 404
  end
end
