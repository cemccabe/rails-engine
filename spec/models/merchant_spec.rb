require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many :items }
  end

  describe 'class methods' do
    describe '#search' do
      it 'finds a merchant by its full name' do
        create_list(:merchant, 5)
        merchant = Merchant.first

        expect(Merchant.search(merchant.name)).to eq([merchant])
      end

      it 'finds a merchant by its partial name' do
        merchant1 = create(:merchant, name: 'XChristian')
        merchant2 = create(:merchant, name: 'Chris')
        merchant3 = create(:merchant, name: 'Sampson')

        expect(Merchant.search('Chr')).to eq([merchant2])
      end
    end
  end
end
