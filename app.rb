require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/property'
require_relative './lib/user'
require_relative './database_connection_setup'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash

  enable :sessions

  get '/' do
    redirect '/listings'
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

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/listings'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    p user
    session[:user_id] = user.id
    redirect '/listings'
  end

  run! if app_file == $0
end
