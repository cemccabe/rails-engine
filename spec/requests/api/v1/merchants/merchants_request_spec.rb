require 'rails_helper'

describe 'Merchants API' do
  it 'sends a list of all merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(merchants.count).to eq(3)

    merchants.each do |merchant|
      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_a(String)

      expect(merchant).to have_key(:type)
      expect(merchant[:type]).to eq("merchant")
      
      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)
    end
  end
  
  it 'sends a list of one merchant' do
    id = create(:merchant).id
    
    get "/api/v1/merchants/#{id}"
    
    merchant = JSON.parse(response.body, symbolize_names: true)[:data]
    
    expect(response).to be_successful
    
    expect(merchant).to have_key(:id)
    expect(merchant[:id]).to eq("#{id}")
    
    expect(merchant).to have_key(:type)
    expect(merchant[:type]).to eq("merchant")
    
    expect(merchant[:attributes]).to have_key(:name)
    expect(merchant[:attributes][:name]).to be_a(String)

  end
end