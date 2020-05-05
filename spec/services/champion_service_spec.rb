
require 'rails_helper'

describe ChampionService do

  it "can get a JSON" do
    champion_service = ChampionService.new
    champion_service.add_champs

    expect(Champion.count).to eq(148)
    expect(Champion.first.name).to eq("Aatrox")
  end
end
