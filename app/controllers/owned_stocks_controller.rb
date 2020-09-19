class OwnedStocksController < ApplicationController

  get '/owned_stocks' do 
      @owned_stocks = current_user.owned_stocks
      erb :owned_stock_index
    end

  post '/owned_stocks/new' do
      params[:allow_edit] = true
      @new_owned_stock = Stock.create(params)
      owned_stock = OwnedStock.create(user_id:current_user.id, stock_id:@new_owned_stock.id)
      erb :'/owned_stocks/new_owned_stock'
  end

  get '/owned_stocks/:id/edit' do
    if logged_in?
      @owned_stock = OwnedStock.find(params[:id])
      @stock = Stock.find(@owned_stock.stock_id)
      if @owned_stock.user_id == current_user.id && @stock.allow_edit == true
        erb :'owned_stocks/edit'
      else
        redirect to '/failure'
      end
    else
      redirect to '/failure'
    end
  end

   patch '/owned_stocks/:id' do
    if logged_in?
      @owned_stock = OwnedStock.find(params[:id])
      if @owned_stock.user_id == current_user.id
        @owned_stock.stock.update(name:params[:name], ticker_symbol:params[:ticker_symbol], category:params[:category], price:params[:price])
        redirect to "/owned_stocks/#{@owned_stock.id}"
      else
        redirect to '/failure'
      end
    else
      redirect to '/failure'
    end
  end



  delete '/owned_stocks/:id/delete' do
    if logged_in?
      @owned_stock = OwnedStock.find(params[:id])
      if @owned_stock.user_id == current_user.id
        @owned_stock.destroy
        OwnedStock.all.reload
        redirect to '/users/show'
      else
        redirect to '/failure'
      end
    else
      redirect to '/failure'
    end
  end
  
  get '/owned_stocks/:id' do
    if logged_in?
      @owned_stock = OwnedStock.find_by(id: params[:id])
      if @owned_stock.user_id == current_user.id
        erb :'owned_stocks/show'
      else
        redirect to '/failure'
      end
    else
      redirect to '/failure'
    end
  end

end