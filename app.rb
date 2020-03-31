require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'open-uri'
require 'net/http'
require 'json'

require './models'

enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user])
  end
end

before do
  Dotenv.load
  Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUD_NAME']
  config.api_key = ENV['CLOUDINARY_API_KEY']
  config.api_secret = ENV['CLOUDINARY_API_SECRET']
  end
end

get '/' do
  p User.all
  @user = User.all
  #   User.where(name: "nul_20shinkan").update(
  #   kou_url: nil
  # )
  erb :index
end

get '/signin' do
  erb :signin
end

post '/signin' do
  user = User.find_by(name: params[:name])
  if user && user.authenticate(params[:password])
    session[:user] = user.id
  end
  redirect '/'
end

get '/logout' do
  session[:user] = nil
  redirect '/'
end

post '/create' do
  user = User.find_by(name: "nul_20shinkan")
  user.update(
    kou_url: params[:name]
  )
  redirect '/'
end

get '/destroy' do
  User.where(name: current_user.id).update(
    kou_url: nil
  )
  redirect '/'
end