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
          
        end
      end
    end
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

end
