class Event < ActiveRecord::Base

  scope :latest, :order => 'id DESC'
  
  scope :by_service, lambda { |service|
    {:conditions => {:service => service}} unless service.blank?
  }
  
  def self.create_from_request(service, request)
    headers = request.headers.reject { |k, v| k != 'rack.url_scheme' && k.include?('.') }
    
    create! :service => service,
      :payload => request.raw_post,
      :content_type => request.content_type,
      :data => request.request_parameters,
      :headers => {}.update(headers)
  end
  
  serialize :data
  serialize :headers

end