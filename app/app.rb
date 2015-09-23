require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  # set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :homepage
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    input = params[:tag].split(' ')
    input.each do |input|
      tag = Tag.create(name: input)
      link.tags << tag
    end
    link.save
    # Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first name: params[:name]
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
