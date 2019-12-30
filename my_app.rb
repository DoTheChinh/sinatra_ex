# require 'app_konfig'
# require 'haml'
# require 'httparty'
# require 'pry'
# require 'puma'
# require 'sidekiq'
require 'sinatra'
# require 'sinatra/reloader'
require 'yaml/store'


Choices = {
    'HAM' => 'Hamburger',
    'PIZ' => 'Pizza',
    'CUR' => 'Curry',
    'NOO' => 'Noodles',
  }

get "/" do
  @title =  'Welcome to the Suffragist!'
  erb :index
end

post '/cast' do
  @vote = params['vote']
  if @vote
    @store = YAML::Store.new 'vote.yml'
    @store.transaction do
      @store['votes'] ||= {}
      @store['votes'][@vote] ||= 0
      @store['votes'][@vote] += 1
    end
    @title = ' Thanks for casting your vote!'
    erb :cast
  else
    @title =  'Welcome to the Suffragist!'
    erb :index
  end
end

get '/results' do
  @title = "result so far: "
  @store = YAML::Store.new 'vote.yml'
  @votes = @store.transaction { @store['votes']}
  # @votes = { 'HAM' => 7, 'PIZ' => 5, 'CUR' => 3}
  erb :results
end
