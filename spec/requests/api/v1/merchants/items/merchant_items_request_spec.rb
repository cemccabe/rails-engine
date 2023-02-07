require 'rails_helper'

describe 'Merchant Items API' do
  it 'gets all items for a given merchant ID' do
    merchant = create(:merchant)
    create_list(:item, 3, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful
  end
end