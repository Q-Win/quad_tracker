class ChampionsController < ApplicationController

  def index
    @filter = params[:filter]
    if @filter == "matches1"
      @champions = Champion.joins(:matches).group('champions.id').having('COUNT(champions.*) >=1')
    elsif @filter == "matches5"
      @champions = Champion.joins(:matches).group('champions.id').having('COUNT(champions.*) >=5')
    elsif @filter == "matches10"
      @champions = Champion.joins(:matches).group('champions.id').having('COUNT(champions.*) >=10')
    elsif @filter == "win-rate"
      @champions = Champion.sort_by_win_rate
    elsif @filter == "all"
      @champions = Champion.all
    else
      @champions = Champion.all
    end
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
