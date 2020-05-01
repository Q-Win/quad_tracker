class RiotService

  def initialize(api_key)
    @api_key = api_key
  end

  def matches
    encryptedAccountId = Player.first.account_id
    get_json("/lol/match/v4/matchlists/by-account/#{encryptedAccountId}?api_key=#{@api_key}")[:matches]
  end

  private

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://na1.api.riotgames.com/')
  end

end
