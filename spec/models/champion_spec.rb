require 'rails_helper'

RSpec.describe Champion, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:champ_id)}
  end
end
