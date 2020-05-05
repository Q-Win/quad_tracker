require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'Relationship' do
    it { should have_many(:match_champions) }
    it { should have_many(:champions).through(:match_champions)}
  end
end
