require 'bundler/setup'
Bundler.require

if development?
  ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end

class User < ActiveRecord::Base
  has_secure_password
  validates :name,
    presence: true
  validates :password,
    length: {in: 5..10 }
  has_many :userfavos
  has_many :musics, through: :userfavos
end

class Music < ActiveRecord::Base
  has_many :userfavos
  has_many :users, through: :userfavos
end

class Userfavo < ActiveRecord::Base
  belongs_to :user
  belongs_to :music
end