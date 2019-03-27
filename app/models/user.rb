class User < ApplicationRecord	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :white_games, :class_name => "Game", :foreign_key => "white_id"
  has_many :black_games, :class_name => "Game", :foreign_key => "black_id"
end
