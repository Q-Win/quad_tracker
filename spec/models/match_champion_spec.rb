require 'rails_helper'

RSpec.describe MatchChampion, type: :model do
  describe 'Relationship' do
    it { should belong_to(:champion)}
    it { should belong_to(:match)}
  end
end
