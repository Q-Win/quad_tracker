class ChampionsController < ApplicationController

  def show
    @champ = Champion.find(params[:id])
    @win_rate = @champion.win_rate
  end


  def addchamps
    champion_service = ChampionService.new
    champion_service.add_champs
    redirect_to root_path
  end

  def addchampionstomatches
    champion_service = RiotService.new('RGAPI-e90326ec-e187-4e1f-8d15-c16a882940f4')
    champion_service.add_champions_to_matches
    redirect_to root_path
  end


end
