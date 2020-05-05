class Match < ApplicationRecord
  validates_uniqueness_of :game_id
  has_many :match_champions
  has_many :champions, through: :match_champions
end
