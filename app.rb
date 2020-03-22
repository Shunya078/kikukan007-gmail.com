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

get '/bungaku' do
  p User.all
  erb :bungaku
end

post '/bungaku_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    bungaku_image: image
  )
  redirect '/bungaku'
end

get '/buturi' do
  erb :buturi
end

post '/buturi_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    buturi_image: image
  )
  redirect '/buturi'
end

get '/denzyo' do
  erb :denzyo
end

post '/denzyo_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    denzyo_image: image
  )
  redirect '/denzyo'
end

get '/eneri' do
  erb :eneri
end

post '/eneri_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    eneri_image: image
  )
  redirect '/eneri'
end

get '/hou' do
  erb :hou
end

post '/hou_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    hou_image: image
  )
  redirect '/hou'
end

get '/housya' do
  erb :housya
end

post '/housya_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    housya_image: image
  )
  redirect '/housya'
end

get '/kango' do
  erb :kango
end

post '/kango_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    kango_image: image
  )
  redirect '/kango'
end

get '/kasei' do
  erb :kasei
end

post '/kasei_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    kasei_image: image
  )
  redirect '/kasei'
end

get '/keizai' do
  erb :keizai
end

post '/keizai_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    keizai_image: image
  )
  redirect '/keizai'
end

get '/kensa' do
  erb :kensa
end

post '/kensa_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    kensa_image: image
  )
  redirect '/kensa'
end

get '/kentiku' do
  erb :kentiku
end

post '/kentiku_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    kentiku_image: image
  )
  redirect '/kentiku'
end

get '/kikou' do
  erb :kikou
end

post '/kikou_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    kikou_image: image
  )
  redirect '/kikou'
end

get '/konpixyuta' do
  erb :konpixyuta
end

post '/konpixyuta_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    konpixyuta_image: image
  )
  redirect '/konpixyuta'
end

get '/kyoiku' do
  erb :kyoiku
end

post '/kyoiku_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    kyoiku_image: image
  )
  redirect '/kyoiku'
end

get '/mate' do
  erb :mate
end

post '/mate_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    mate_image: image
  )
  redirect '/mate'
end

get '/ningen' do
  erb :ningen
end

post '/ningen_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    ningen_image: image
  )
  redirect '/ningen'
end

get '/ousei' do
  erb :ousei
end

post '/ousei_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    ousei_image: image
  )
  redirect '/ousei'
end

get '/rigaku' do
  erb :rigaku
end

post '/rigaku_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    rigaku_image: image
  )
  redirect '/rigaku'
end

get '/rigakuryoho' do
  erb :rigakuryoho
end

post '/rigakuryoho_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    rigakuryoho_image: image
  )
  redirect '/rigakuryohoho'
end

get '/sagyoryoho' do
  erb :sagyoryoho
end

post '/sagyoryoho_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    sagyoryoho_image: image
  )
  redirect '/sagyoryoho'
end

get '/seibutu' do
  erb :seibutu
end

post '/seibutu_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    seibutu_image: image
  )
  redirect '/seibutu'
end

get '/sizen' do
  erb :sizen
end

post '/sizen_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    sizen_image: image
  )
  redirect '/sizen'
end

get '/sizenseibutu' do
  erb :sizenseibutu
end

post '/sizenseibutu_create' do
  user = User.find_by(name: "nul_20shinkan")
  image = ''
  if params[:file]
    img_file = params[:file]
    tempfile = img_file[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    image = upload['url']
  end
  user.update(
    sizenseibutu_image: image
  )
  redirect '/sizenseibutu'
end