class ServicesController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create

  def index
    @events = Event.latest.limit(10)
  end
  
  def show
    @events = Event.latest.by_service(params[:service]).limit(20)
  end
  
  def create
    Event.create_from_request(params[:service], request)
    head :ok
  end

end
