module Api
  module V1
    class DealSerializer
      include JSONAPI::Serializer

      attributes :id, :name
    end
  end
end
