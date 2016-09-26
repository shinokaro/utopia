require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryGirl.create(:user) }
  describe 'associations' do
    it { is_expected.to have_one(:profile)}
  end
end
