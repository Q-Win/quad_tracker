
require 'rails_helper'

describe GithubService do

  it "can get a JSON" do
    champion_service = ChampionService.new
      
    expect(champion_service.).to be_a(Hash)
end
