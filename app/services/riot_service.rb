class RiotService

  def initialize(api_key)
    @api_key = api_key
  end

  def matches
    encryptedAccountId = Player.first.account_id
    get_json("/lol/match/v4/matchlists/by-account/#{encryptedAccountId}?api_key=#{@api_key}")[:matches]
  end

  def match(match_id)
    get_json("/lol/match/v4/matches/#{match_id}?api_key=#{@api_key}")
  end

  def update_matches
    #set up variables. Will just use my ID and being_time so we don't ping matches we already have
    encryptedAccountId = Player.first.account_id
    begin_time = Match.last.start_time

    new_matches = get_json("/lol/match/v4/matchlists/by-account/#{encryptedAccountId}?api_key=#{@api_key}&beginTime=#{begin_time}")[:matches]

    new_matches.each do |match|
      #filter out games that are normals
      if match[:queue] == 400
        match_data = match(match[:gameId])
        #filter out matches to see if all 4 are there
        if everyone?(match_data[:participantIdentities])
          win = win?(match_data)
          Match.create(win: win, game_id: match[:gameId], start_time: match[:timestamp])
        end
      end
    end
  end

  def add_champions_to_matches
    matches_without_champs = Match.includes(:champions).where(champions: {id: nil})
    #iterate over matches without champs
    matches_without_champs.each do |m|
      get_champions_for_match(m.game_id)
    end
    #do get_champs(match_id) to each
  end

  private

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://na1.api.riotgames.com/')
  end

  def everyone?(participant_array)
    player1 = Player.all[0].account_id
    player2 = Player.all[1].account_id
    player3 = Player.all[2].account_id
    player4 = Player.all[3].account_id

    count = participant_array.select { |p| [player1, player2, player3, player4].include?(p[:player][:accountId]) }.count
    count == 4
  end

  def win?(match_data)
    participant = match_data[:participantIdentities].find {|p| p[:player][:accountId] == Player.first.account_id }
    participant_id = participant[:participantId]
    participant_data = match_data[:participants].find {|p| p[:participantId] == participant_id }
    participant_data[:stats][:win]
  end

  def get_champions_for_match(game_id)
    match_data = match(game_id)
    player1 = Player.all[0].account_id
    player2 = Player.all[1].account_id
    player3 = Player.all[2].account_id
    player4 = Player.all[3].account_id

    player1_particpant_id = match_data[:participantIdentities].find {|p| p[:player][:accountId] == player1}[:participantId]
    player2_particpant_id = match_data[:participantIdentities].find {|p| p[:player][:accountId] == player2}[:participantId]
    player3_particpant_id = match_data[:participantIdentities].find {|p| p[:player][:accountId] == player3}[:participantId]
    player4_particpant_id = match_data[:participantIdentities].find {|p| p[:player][:accountId] == player4}[:participantId]

    player1_data= match_data[:participants].find {|p| p[:participantId] ==  player1_particpant_id}
    player1_champ_id = player1_data[:championId]

    player2_data= match_data[:participants].find {|p| p[:participantId] ==  player2_particpant_id}
    player2_champ_id = player2_data[:championId]

    player3_data= match_data[:participants].find {|p| p[:participantId] ==  player3_particpant_id}
    player3_champ_id = player3_data[:championId]

    player4_data= match_data[:participants].find {|p| p[:participantId] ==  player4_particpant_id}
    player4_champ_id = player4_data[:championId]

    match_id = Match.find_by(game_id: game_id).id



    MatchChampion.create(match_id: match_id, champion_id: Champion.find_by(champ_id: player1_champ_id).id ,player_id: Player.all[0].id, player_name: Player.all[0].name)

    MatchChampion.create(match_id: match_id, champion_id: Champion.find_by(champ_id: player2_champ_id).id, player_id: Player.all[1].id, player_name: Player.all[1].name)

    MatchChampion.create(match_id: match_id, champion_id: Champion.find_by(champ_id: player3_champ_id).id ,player_id: Player.all[2].id, player_name: Player.all[2].name)

    MatchChampion.create(match_id: match_id, champion_id: Champion.find_by(champ_id: player4_champ_id).id, player_id: Player.all[3].id, player_name: Player.all[3].name)

  end

end
