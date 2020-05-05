class ChampionsController < ApplicationController
  
  def addchamps
    champion_service = ChampionService.new
    champion_service.add_champs
    redirect_to root_path
  end


end
