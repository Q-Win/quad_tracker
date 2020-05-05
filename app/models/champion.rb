class Champion < ApplicationRecord
  validates :name, presence: true
  validates :champ_id, presence: true
end
