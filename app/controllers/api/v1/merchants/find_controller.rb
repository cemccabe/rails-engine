module Api
  module V1
    module Merchants
      class FindController < ApplicationController
        def index
          merchant = Merchant.search(params[:name])
          render json: MerchantSerializer.new(merchant)
        end
      end
    end
  end
end