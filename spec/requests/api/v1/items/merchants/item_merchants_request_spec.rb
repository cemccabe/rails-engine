require 'rails_helper'

describe 'Item Merchants API' do
  it 'shows merchant associated with an item' do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    create_list(:item, 3, merchant_id: merchant1.id)
    create_list(:item, 3, merchant_id: merchant2.id)

    item = Item.first

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful
  end
end