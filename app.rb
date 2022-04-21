require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/property'
require './database_connection_setup'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello world'
  end
  
  get '/listings' do
    @listings = Property.all
    erb :listings
  end

  get '/listings/new' do
    erb :'listings/new'
  end
  
  post '/listings/new/add' do
    Property.create(name: params[:name], description: params[:description], price_per_night: params[:price_per_night])
    redirect '/listings'
  end

  get '/booking' do
    erb :booking
  end

  get '/booking/confirmation' do
    erb :'confirmation'
    
  end

  post '/booking/new' do
    redirect '/booking/confirmation'
  end
  run! if app_file == $0
end
