heroku = !!ENV['HEROKU_TYPE']

Sass::Plugin.options[:template_location] = {
  "#{Rails.root}/app/styles" => heroku ?
    "#{Rails.root}/tmp/stylesheets" : "#{Rails.root}/public/stylesheets"
}

if heroku
  # add Rack middleware to serve compiled stylesheets from "tmp/stylesheets"
  Rails.configuration.middleware.insert_after 'Sass::Plugin::Rack', 'Rack::Static',
    :urls => ['/stylesheets'], :root => "#{Rails.root}/tmp"
end
