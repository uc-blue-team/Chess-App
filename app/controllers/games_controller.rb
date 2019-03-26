class GamesController < ApplicationController
  
  def new
  	@game = Game.new
  end

  def create
  	@game = Game.create(game_params)
  end

  def show
  end




  private
  	def game_params
  		params.require(:game).permit(:name)
  	end

end
