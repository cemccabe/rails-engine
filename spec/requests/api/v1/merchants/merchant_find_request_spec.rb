require 'rails_helper'

describe 'Merchant Find API' do
  before(:each) do
    @merchant1 = create(:merchant, name: 'Christian')
    @merchant2 = create(:merchant, name: 'Chris')
    @merchant3 = create(:merchant, name: 'Christopher')
    @merchant4 = create(:merchant, name: 'Sampson')
  end

  describe 'return a single object, if found' do
    it 'searches for a single object' do
      get "/api/v1/merchants/find?name=#{@merchant4.name}"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to eq("#{@merchant4.id}")

      expect(merchant).to have_key(:type)
      expect(merchant[:type]).to eq('merchant')

      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to eq("#{@merchant4.name}")
    end
  end
end