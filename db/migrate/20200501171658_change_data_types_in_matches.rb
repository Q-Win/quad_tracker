class ChangeDataTypesInMatches < ActiveRecord::Migration[5.2]
  def change
    change_column :matches, :start_time, :integer
    change_column :matches, :game_id, :integer
  end
end
