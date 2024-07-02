# frozen_string_literal: true

module Api
  module V1
    class OrdersController < BaseController
      actions :create, :show, :update, :destroy

      private

      def permitted_params
        params.require(:order).permit(order_items_deals_attributes: %i[id orderable_type orderable_id quantity]).tap do |whitelisted_params|
          whitelisted_params[:user_id] = current_user.id
        end
      end
    end
  end
end
