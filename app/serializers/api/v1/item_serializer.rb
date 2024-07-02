module Api
  module V1
    class ItemSerializer
      include JSONAPI::Serializer

      attributes :id, :name
    end
  end
end
