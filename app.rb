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

get '/' do
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
  end

  @user = User.create(name:params[:name], password:params[:password],
    password_confirmation:params[:password_confirmation], img: img)
  if @user.persisted?
    session[:user] = @user.id
    redirect '/search'
  else
    redirect '/'
  end
end

post '/signin' do
  user = User.find_by(name: params[:name])
  if user && User.authenticate(params[:password])
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
  @musics = Music.all
  erb :search
end

post '/search' do
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
  @results = returned_json["results"]

end

post '/new' do
  current_user.music.create(
    artist: params[:artist],
    title: params[:title],
    album: params[:album],
    comment: params[:comment],
    img: params[:image_url],
    sample: params[:sample_url],
    user_id: current_user.id
  )
  redirect '/home'
end

get '/home/:id' do
  @musics = current_user.musics
  erb :home
end

get '/edit/:id' do
  erb :edit
end

post '/edit/:id' do
  music = Music.find(params[:id])
  music.comment = params[:comment]
  music.save
  redirect '/home'
end

post '/delete/:id' do
  Music.find(params[:id]).destroy
  redirect '/home/:id'
end
