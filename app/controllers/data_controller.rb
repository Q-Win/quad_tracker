class DataController < ApplicationController

  def updatematches
    riot_service = RiotService.new('RGAPI-ed53936c-cd12-4761-ab31-f940cddcc4e9')
    riot_service.update_matches
  end

end
