 require 'bundler/setup'
 Bundler.require(:default)
require "make_todo"

get '/' do
    @sort = 0
    
    @posts = Tarea.all
        @doneposts = []
        @undoneposts = []
    @posts.each do |posts|
        posts["done"] ? @doneposts << posts : @undoneposts << posts
    end
    erb :home
end

post '/post' do
    @post = Tarea.create(params[:body])
    redirect '/'
end

get '/post/:id' do
    @post = Tarea.find(params[:id])
    redirect '/'
end

delete '/post/:id' do
    Tarea.destroy(params[:id])
    redirect '/'
  end

get '/complete/:id' do
    @post = Tarea.update(params[:id])
    redirect '/'
end
