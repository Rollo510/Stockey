class ListsController < ApplicationController

get '/lists' do 
    @lists = current_user.lists
    erb :list_index
  end

  get '/lists/new' do
    erb :new_list
  end

  post '/lists' do
    attributes = params
    @list = List.create(attributes)
    redirect to "/lists/#{@list.id}"
  end

  get '/lists/:id' do
    id = params[:id]
    @list = List.find_by(id: id)
    erb :list_show
  end

  get '/lists/:id/edit' do
    @list = List.find_by(id: params[:id])
    erb :edit_list
  end

  patch '/lists/:id' do
    @list = List.find_by(id: params[:id])
    attributes = params[:list]
    @list.update(attributes)
    redirect to "/lists/#{@list.id}"
  end

  delete '/lists/:id' do
    list = List.find_by(id: params[:id])
    list.destroy
    redirect to erb :show
  end
