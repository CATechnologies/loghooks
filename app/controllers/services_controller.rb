class ServicesController < ApplicationController

  def index
    @events = Event.all :order => 'ID desc', :limit => 10
  end
  
  def show
    @events = Event.where(:service => params[:service]).order('ID desc').limit(50)
  end
  
  def create
    Event.create :service => params[:service], :payload => request.raw_post
    render :text => 'ok'
  end

end
