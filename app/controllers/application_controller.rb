require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :index
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    erb :show
    redirect "/recipes/#{@recipe.id}"
  end

  # post '/recipes' do
  #   @recipe = Recipe.create(params)
  #   erb :recipe
  # end

  get '/recipes' do
    @recipes = Recipe.all
    erb :recipe
  end


  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    erb :delete
  end


end
