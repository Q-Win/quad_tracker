class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.boolean :win
      t.integer :start_time
      t.timestamps
    end
  end
end
