heroku = !!ENV['HEROKU_TYPE']
controller_config = ActionController::Base.config
rails_config = Rails.configuration

if heroku
  controller_config.stylesheets_dir = File.join(ENV['TMPDIR'], 'stylesheets')
  rails_config.action_dispatch.x_sendfile_header = ''
  rails_config.serve_static_assets = true
  
  # add Rack middleware to serve compiled stylesheets from "tmp/stylesheets"
  rails_config.middleware.insert_after 'Sass::Plugin::Rack', 'Rack::Static',
    :urls => ['/stylesheets'], :root => ENV['TMPDIR']
end

Sass::Plugin.options[:template_location] = {
  "#{Rails.root}/app/styles" => controller_config.stylesheets_dir
}
