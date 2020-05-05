
require 'rails_helper'

describe RiotService do

   before(:each) do
     Player.create(name: "Quinn",
       player_name: "k1dRock",
       summoner_id: "crrLIQBR3WnqKraXZRDO9BWnEkY281QBgqRcRnTdt9v5Q2I",
       account_id: "_9LQUmxhNxcrQQWWpcH6ptfm-5EjPP2UWTo9Jx1VV2HRgFtmJdWCnwJ8")

     Player.create(name: "Jordan",
       player_name: "Marty MçFly",
       summoner_id: "kOn3urlQNaGt2YWzaIwAXL6QeX8Dx3vabDLtG2DWMrtuTE0",
       account_id: "KcALHYLCc4jnz2E7tMm57GI3CG8zgiY9joNeLA9k9EYqduQ")

     Player.create(name: "Greg",
       player_name: "Mr Meešeeks",
       summoner_id: "edRb3G06zmajtCODjfB-3eGDYsB-0oQPAk2eqe4jEaXoX1Q",
       account_id: "G1KPf8PCZfZKQ2M8cTYXrhLwsT8j4vJ0DfqZHI80p3sv0UfwU5jbo9_H")

     Player.create(name: "Tyson",
       player_name: "Doç Brown",
       summoner_id: "WhQTVaq1Yzw7i3Txv91vU0AnGbEN1sWRPyPxg4S_H1bakZM",
       account_id: "c97nIYA4DEUy0GDqyJoxAeD2zuc1yHeONCoacueE6wBCnbo")
     @match1 = Match.create(win: true,
       start_time: 1587946463079,
       game_id: 3394205943)
     @matach2 = Match.create(win: true,
       start_time: 1587946464079,
       game_id: 3394205941)
     @api_key = 'RGAPI-ed53936c-cd12-4761-ab31-f940cddcc4e9'
     @champ = Champion.create(name: "Olaf", champ_id: 2)
     MatchChampion.create(match_id: @match1.id, champion_id: @champ.id, player_id: 1, player_name: "k1dRock")
   end

  it "can get a JSON" do
    riot_service = RiotService.new(@api_key)
    riot_service.add_champions_to_matches

  end
end
