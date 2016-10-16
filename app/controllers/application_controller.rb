require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  DELETED_POSTS = []

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.all.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.all.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    Post.update(params[:id], name: params[:name], content: params[:content])
    redirect "/posts/#{params[:id]}"
  end

  delete '/posts/:id/delete' do
    DELETED_POSTS << Post.all.find(params[:id]).name
    Post.delete(params[:id])
    redirect '/posts'
  end
end
