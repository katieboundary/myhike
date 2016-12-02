require 'yaml'

# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

if File.exists?('secrets.yml')
  YAML.load(File.read('secrets.yml')).each do |key, value|
    ENV[key] = value
  end
end

configure do
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

run Sinatra::Application
