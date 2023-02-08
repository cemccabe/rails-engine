module Api
  module V1
    class ItemsController < ApplicationController
      def index
        render json: ItemSerializer.new(Item.all)
      end

      def show
        render json: ItemSerializer.new(Item.find(params[:id]))
      end

      def create
        item = Item.new(item_params)
        item.save
        render json: ItemSerializer.new(item), status: :created
      end

      def update
        item = Item.update(params[:id], item_params)
        render json: ItemSerializer.new(item)
      end

      private

      def item_params
        params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
      end
    end
  end
end