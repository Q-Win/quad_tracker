class AddPlayeridAndPlayernameToMatchChampion < ActiveRecord::Migration[5.2]
  def change
    add_column :match_champions, :player_id, :integer
    add_column :match_champions, :player_name, :string
  end
end
