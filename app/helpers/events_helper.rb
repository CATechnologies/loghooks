require 'yaml'

module EventsHelper
  
  def pretty_data(event)
    if event.data.blank?
      event.data.inspect
    else
      YAML.dump(event.data).sub(/.+\n/, '')
    end
  end
  
end
