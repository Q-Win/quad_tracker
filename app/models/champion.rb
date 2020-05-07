class Champion < ApplicationRecord
  validates :name, presence: true
  validates :champ_id, presence: true
  has_many :match_champions
  has_many :matches, through: :match_champions

  def win_rate
    wins = matches.where(win: true).count
    total = matches.count

    ((wins.to_f)/(total.to_f)).round(2)
  end

  def self.sort_by_win_rate

  end

  def self.sort_by_total_games
    .joins(:matches).group("matches")

    .joins(:jobs).group("jobs.company_id").order("count(jobs.company_id) desc")
  end
end
