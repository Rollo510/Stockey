require './config/environment'
require './app/models/list.rb'
require './app/models/user.rb'
require './app/models/stock.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_password!"
  end

  get '/' do
    erb :welcome
  end

  # get '/login' do
  #   @session = session
  #   session[:id]
  # end

  

end
