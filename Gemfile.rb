group :development do
    gem 'shotgun'
  end
  
  # Run the command
  shotgun
  
  # == Shotgun/Puma on http://127.0.0.1:9393/
  # …
  gem 'sinatra', require: %w(sinatra/base sinatra/reloader)
  gem 'sinatra-contrib