# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :deal_items, dependent: :destroy
  has_many :deals, through: :deal_items
  has_many :order_items_deals, as: :orderable, dependent: :destroy

  enum category: { beverages: 0, sandwitch: 1 }

  scope :available_items, -> { where(is_available: true) }

  validates :name, presence: true
end
