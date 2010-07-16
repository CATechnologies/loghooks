class Event < ActiveRecord::Base

  scope :latest, :order => 'id DESC'
  
  scope :by_service, lambda { |service|
    {:conditions => {:service => service}} unless service.blank?
  }
  
  def self.create_from_request(service, request)
    create!(:service => service, :payload => request.raw_post)
  end

end