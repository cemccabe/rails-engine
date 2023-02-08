require 'rails_helper'

describe 'Items API' do
  it 'sends a list of all items' do
    merchant = create(:merchant)
    create_list(:item, 3, merchant_id: merchant.id)

    get '/api/v1/items'

    expect(response).to be_successful
  end
end