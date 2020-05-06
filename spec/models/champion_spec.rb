require 'rails_helper'

RSpec.describe Champion, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:champ_id)}
  end
  describe 'Relationship' do
    it { should have_many(:match_champions) }
    it { should have_many(:matches).through(:match_champions)}
  end

  describe 'Methods' do

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
     @match2 = Match.create(win: true,
       start_time: 1587946464079,
       game_id: 3394264149)
     @match3 = Match.create(win: false,
       start_time: 1587946464080,
       game_id: 1)
     @match4 = Match.create(win: false,
       start_time: 1587946464081,
       game_id: 2)
     @champ = Champion.create(name: "Olaf", champ_id: 2)
     MatchChampion.create(match_id: @match1.id, champion_id: @champ.id, player_id: 1, player_name: "k1dRock")
     MatchChampion.create(match_id: @match3.id, champion_id: @champ.id, player_id: 1, player_name: "k1dRock")
     MatchChampion.create(match_id: @match4.id, champion_id: @champ.id, player_id: 1, player_name: "k1dRock")
   end

   it 'can return the win rate for a champion' do
     win_rate = @champ.win_rate

     expect(win_rate).to eq(0.33)
   end
 end
end
