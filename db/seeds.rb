# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

Match.create(win: true, game_id: 1, start_time: 1587241051000)
