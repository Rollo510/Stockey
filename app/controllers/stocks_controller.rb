class StocksController < ApplicationController

  get "/stocks" do
    if logged_in?
      @stocks = current_user.stocks
      @all_stocks = Stock.all
      erb :"/stocks/index"
    else
      redirect to '/failure'
    end
  end

  get "/stocks/new" do
    erb :"/stocks/new.html"
  end

  post '/stocks/:id/add_new_stock' do
    @stock = Stock.find(params[:id])
    new_stock = OwnedStock.find_or_create_by(user_id:current_user.id, stock_id:@stock.id)
    redirect to '/users/show'
  end

  get '/stocks/:id' do
    if logged_in?
      @stock = Stock.find(params[:id])
      erb :'stocks/show'
    else
      redirect to '/failure'
    end
  end

end
