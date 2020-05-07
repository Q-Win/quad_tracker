class Champion < ApplicationRecord
  validates :name, presence: true
  validates :champ_id, presence: true
  has_many :match_champions
  has_many :matches, through: :match_champions

  def win_rate
    if matches.count == 0
      return 0
    else
      wins = matches.where(win: true).count
      total = matches.count
      ((wins.to_f)/(total.to_f)).round(2)
    end
  end

  def self.sort_by_win_rate

  end


end
