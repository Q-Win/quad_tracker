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
    riot_service = RiotService.new('RGAPI-bd04065e-6637-4836-a160-98d2a4ef41b6')
    riot_service.update_matches
    riot_service.add_champions_to_matches
    redirect_to root_path
  end


end
