require './config/environment'
require './app/models/owned_stock.rb'
require './app/models/user.rb'
require './app/models/stock.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "TdGGhoB25903DF"
  end

  get '/' do
    erb :welcome
  end

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
  




end
