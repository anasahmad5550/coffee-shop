module Api
  module V1
    class OrderSerializer
      include JSONAPI::Serializer

      attributes :id, :total, :status
      belongs_to :user
      has_many :order_items_deals
    end
  end
end
