require 'yaml'

module EventsHelper
  
  def pretty_data(event)
    if event.data.blank?
      event.data.inspect
    else
      if event.data.keys == %w[payload]
        data = ActiveSupport::JSON.decode event.data['payload']
        comment = 'JSON-encoded string received under "payload" key'
      else
        data = event.data
        comment = nil
      end
      
      output = YAML.dump(data).sub(/.+\n/, '')
      output = "# #{comment}\n" + output if comment
      output
    end
  end
  
end
