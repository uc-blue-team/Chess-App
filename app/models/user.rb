class User < ApplicationRecord	
	has_many :games
	has_many :white_games, :class_name => "Games", :foreign_key => "WhitePlayer"
	has_many :black_games, :class_name => "Games", :foreign_key => "BlackPlayer"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
