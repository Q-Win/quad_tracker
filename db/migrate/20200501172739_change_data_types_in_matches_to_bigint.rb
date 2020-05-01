class ChangeDataTypesInMatchesToBigint < ActiveRecord::Migration[5.2]
  def change
    change_column :matches, :start_time, :bigint
    change_column :matches, :game_id, :bigint
  end
end
