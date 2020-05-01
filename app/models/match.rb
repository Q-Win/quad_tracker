class Player < ApplicationRecord

  validates_uniqueness_of :game_id

end
