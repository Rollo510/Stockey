class OwnedStocksController < ApplicationController

get '/owned_stocks' do 
    @owned_stocks = current_user.owned_stocks
    erb :owned_stock_index
  end

  get '/owned_stocks/new' do
    erb :new_owned_stock
  end

  post '/owned_stocks' do
    attributes = params
    @owned_stock = OwnedStock.create(attributes)
    redirect to "/owned_stocks/#{@owned_stock.id}"
  end

  # get '/owned_stocks/:id' do
  #   id = params[:id]
  #   @owned_stock = OwnedStock.find_by(id: id)
  #   erb :owned_stock_show
  # end

  get '/owned_stocks/:id/edit' do
    @owned_stock = OwnedStock.find_by(id: params[:id])
    erb :edit_owned_stock
  end

  patch '/owned_stocks/:id' do
    @owned_stock = OwnedStock.find_by(id: params[:id])
    attributes = params[:owned_stock]
    @owned_stock.update(attributes)
    redirect to "/owned_stocks/#{@owned_stock.id}"
  end

  delete '/owned_stocks/:id' do
    owned_stock = OwnedStock.find_by(id: params[:id])
    owned_stock.destroy
    redirect to erb :show
  end


  post '/owned_stocks/:stock_id' do
    @owned_stock = OwnedStock.create(user_id: current_user.id, stock_id: params[:stock_id])
    current_user.reload
    redirect to '/stocks'
  end

  # <h1> Add this stock to your portfolio!</h1>

  # <form method="post" action="/owned_stocks/:stock_id"
  # <input type="submit" 

  

end