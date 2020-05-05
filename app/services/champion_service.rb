class ChampionService


  def add_champs
    champs = get_json
    champs[:data].each do |key, value|
      Champion.create(name: value[:name], champ_id: value[:key])
    end
  end


  private

  def get_json
    response = conn.get

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://ddragon.leagueoflegends.com/cdn/10.2.1/data/en_US/champion.json')
  end

end
