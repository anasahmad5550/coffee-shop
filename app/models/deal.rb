# frozen_string_literal: true

class Deal < ApplicationRecord
  has_many :deal_items, dependent: :destroy
  has_many :items, through: :deal_items
  has_many :order_items_deals, as: :orderable, dependent: :destroy

  scope :available_deals, -> { where(is_available: true) }

  validates :name, presence: true
end
