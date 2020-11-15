require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :email }
  end
  
  describe 'Validations' do
    it { is_expected.to validate_presence_of :email}
    it { is_expected. to validate_presence_of :password}
  end

  describe 'Factory' do
    it 'expects a valid Factory' do
      expect(FactoryBot.create(:user)).to be_valid
    end
  end  
end
