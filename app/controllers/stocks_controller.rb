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

  # GET: /stocks/new
  get "/stocks/new" do
    erb :"/stocks/new.html"
  end

  # POST: /stocks
  post "/stocks" do
    redirect "/stocks"
  end

  get '/stocks/:id' do
    if logged_in?
      @stock = Stock.find(params[:id])
      erb :'stocks/show'
    else
      redirect to '/failure'
    end
  end

  # GET: /stocks/5/edit
  get "/stocks/:id/edit" do
    erb :"/stocks/edit.html"
  end

  # PATCH: /stocks/5
  patch "/stocks/:id" do
    redirect "/stocks/:id"
  end

  # DELETE: /stocks/5/delete
  delete "/stocks/:id/delete" do
    redirect "/stocks"
  end
end
