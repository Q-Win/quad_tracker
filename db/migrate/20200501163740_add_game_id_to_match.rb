class AddGameIdToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :game_id, :integer
  end
end
