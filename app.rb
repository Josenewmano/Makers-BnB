require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/property'
require './database_connection_setup'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end
  
  get '/listings' do
    @listings = Property.all
    erb :listings
  end

  get '/listings/new' do
    erb :'listings/new'
  end
  
  post '/listings/new/add' do
    name = params['name']
    connection = PG.connect(dbname: 'makers_bnb_test')
    connection.exec("INSERT INTO properties (name) VALUES('#{name}')")
    redirect '/listings'
  end

  run! if app_file == $0
end
