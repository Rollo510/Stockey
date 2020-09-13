require './config/environment'
require './app/models/owned_stock.rb'
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

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
  

# User has many stocks through User stocks
# stocks has many users through user stocks
# OwnedStocks belongs to user and stock

# user: username email and password

# userstocks user_id stock_id shares JOIN table

# stock has name ticker category price
# stock should have most logic
# stock index page




end
