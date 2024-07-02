# frozen_string_literal: true

class OrderItemsDeal < ApplicationRecord
  belongs_to :order
  belongs_to :orderable, polymorphic: true
end
