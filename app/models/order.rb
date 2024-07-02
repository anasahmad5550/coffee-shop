# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items_deals, dependent: :destroy

  belongs_to :user

  enum status: { created: 0, paid: 1, notified: 2, completed: 3, rejected: 4 }
  before_save :calculate_cost
  accepts_nested_attributes_for :order_items_deals

  def calculate_cost
    total = 0
    order_items_deals.each do |ordered_item_deal|
      if ordered_item_deal.orderable_type == 'Deal'
        total = calculate_deal_cost(ordered_item_deal)
      else
        total += ordered_item_deal.orderable.price * ordered_item_deal.orderable.quantity
      end
    end
    self.total = total
  end

  private

  def calculate_deal_cost(ordered_item_deal)
    deal_total = 0
    ordered_item_deal.orderable.deal_items.each do |deal_item|
      deal_total += if deal_item.is_free
                      0
                    elsif deal_item.discount_percentage
                      deal_item.item.price * (1 - (deal_item.discount_percentage / 100.0))
                    else
                      deal_item.item.price
                    end
    end
    deal_total *= ordered_item_deal.quantity
  end
end
