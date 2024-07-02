# frozen_string_literal: true

module Api
  module V1
    class ItemsController < BaseController
      def index
        @items = Item.available_items
        @deals = Deal.available_deals

        render json: {
          result: {
            items: Api::V1::ItemSerializer.new(@items).serializable_hash,
            deals: Api::V1::DealSerializer.new(@deals).serializable_hash
          }
        }, status: :ok
      end
    end
  end
end
