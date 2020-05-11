class DataController < ApplicationController

  def home
    match_data = Match.all
    @count = match_data.count
    @matches = match_data.order(start_time: :desc)
    @wins = match_data.where(win: true).count
    @losses = match_data.where(win: false).count
    @win_percent = ((@wins.to_f)/(@matches.count.to_f)*100).round(2)
  end

  def updatematches
    riot_service = RiotService.new('RGAPI-564e5c01-d390-4103-9279-79977fcc27ae')
    riot_service.update_matches
    riot_service.add_champions_to_matches
    redirect_to root_path
  end


end
