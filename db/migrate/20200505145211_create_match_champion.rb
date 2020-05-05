class CreateMatchChampion < ActiveRecord::Migration[5.2]
  def change
    create_table :match_champions do |t|
      t.integer :match_id
      t.integer :champion_id
    end
  end
end
