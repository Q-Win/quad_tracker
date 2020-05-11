class ChampionsController < ApplicationController

  def index
    @champions = Champion.all
  end

  def show
    @champion = Champion.find(params[:id])
    @win_rate = @champion.win_rate
  end


  def addchamps
    champion_service = ChampionService.new
    champion_service.add_champs
    redirect_to root_path
  end

  def addchampionstomatches
    champion_service = RiotService.new('RGAPI-564e5c01-d390-4103-9279-79977fcc27ae')
    champion_service.add_champions_to_matches
    redirect_to root_path
  end


end
