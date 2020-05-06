class Champion < ApplicationRecord
  validates :name, presence: true
  validates :champ_id, presence: true
  has_many :match_champions
  has_many :matches, through: :match_champions

  def win_rate

  end
end
