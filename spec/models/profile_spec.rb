require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject(:profile) { FactoryGirl.create(:profile) }
  describe 'associations' do
    it { is_expected.to belong_to(:user)}
  end
end
