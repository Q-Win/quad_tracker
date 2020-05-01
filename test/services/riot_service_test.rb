require 'test_helper'
require './app/services/riot_service'

class RiotServiceTest < ActionDispatch::IntegrationTest

  def setup
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
    Match.create(win: true,
      start_time: 3394205943,
      game_id: 1587946463079)
  end

  test "it can get matches" do
    riot_service = RiotService.new('RGAPI-d966f66a-351a-475b-805a-66a1e918689c')
    matches = riot_service.matches

    assert_not_nil matches
    assert matches, Array
  end

  test "it can get a match data" do
    riot_service = RiotService.new('RGAPI-d966f66a-351a-475b-805a-66a1e918689c')
    match = riot_service.match('3394308322')

    assert_not_nil match
    assert match, Hash
  end

end
