class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :player_name
      t.string :summoner_id
      t.string :account_id
      t.timestamps
    end
  end
end
