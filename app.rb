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

before ['/search','/home','/new','/edit/:id','/delete:id'] do
    if current_user.nil?
        redirect '/'
    end
end

get '/' do
  @userfavo = Userfavo.all
  @musics = Music.all
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  img = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    img = upload['url']
  else
    img = "https://res.cloudinary.com/dcksv5swp/image/upload/v1549968178/qusyecxamstqbg0lejdz.png"
  end

  @user = User.create(name:params[:name], password:params[:password],
    password_confirmation:params[:password_confirmation], img:img)
  if @user.persisted?
    session[:user] = @user.id
    redirect '/search'
  else
    redirect '/'
  end
end

post '/signin' do
  user = User.find_by(name: params[:name])
  if user && user.authenticate(params[:password])
    session[:user] = user.id
    redirect '/search'
  else
    redirect '/signup'
  end
end

get '/signout' do
  session[:user] = nil
  redirect '/'
end

get '/search' do
  keyword = params[:keyword]
  uri = URI('https://itunes.apple.com/search')
  uri.query = URI.encode_www_form({
    term: keyword,
    country: "US",
    media: "music",
    limit: 10
  })
  res = Net::HTTP.get_response(uri)
  returned_json = JSON.parse(res.body)
  @musics = returned_json["results"]
  erb :search
end

post '/new' do
  current_user.musics.create(
    artist: params[:artist],
    title: params[:title],
    album: params[:album],
    comment: params[:comment],
    img: params[:img],
    sample: params[:sample],
    user_id: current_user.id
  )
  redirect '/home'
end

get '/home' do
  @mymusics = Music.where(user_id: current_user.id)
  @userfavos = Userfavo.where(favorite: current_user.id)
  erb :home
end

get '/edit/:id' do
  @music = Music.find(params[:id])
  erb :edit
end

post '/edit/:id' do
  music = Music.find(params[:id])
  music.comment = params[:comment]
  music.save
  redirect '/home'
end

get '/delete/:id' do
  music = Music.find(params[:id])
  music.destroy
  redirect '/home'
end

get '/favo/:id/create' do
  userfavo = Userfavo.where(music_id: params[:id])
  userfavo.create(
    user_id: current_user.id,
    music_id: params[:id],
    favorite: current_user.id
  )
  redirect '/home'
end

get '/favo/:id/destroy' do
  @music_favo = Userfavo.where(favorite: current_user.id).where(music_id: params[:id])
  @music_favo.each do |music_favo|
    music_favo.destroy
  end
  redirect '/home'
end