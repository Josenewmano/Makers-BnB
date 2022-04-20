require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/property'

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

  run! if app_file == $0
end
