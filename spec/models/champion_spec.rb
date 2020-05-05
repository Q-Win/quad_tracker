require 'rails_helper'

RSpec.describe Champion, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:champ_id)}
  end
  describe 'Relationship' do
    it { should have_many(:match_champions) }
    it { should have_many(:matches).through(:match_champions)}
  end
end
