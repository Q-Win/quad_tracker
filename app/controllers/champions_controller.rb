class ChampionsController < ApplicationController

  def addchamps
    champion_service = ChampionService.new
    champion_service.add_champs
    redirect_to root_path
  end

  def addchampionstomatches
    champion_service = RiotService.new('RGAPI-66beb7c6-3420-45f0-8c0d-2a3ed45cc6d8')
    champion_service.add_champions_to_matches
    redirect_to root_path
  end


end
