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
    riot_service = RiotService.new('RGAPI-ed53936c-cd12-4761-ab31-f940cddcc4e9')
    riot_service.update_matches
  end


end
