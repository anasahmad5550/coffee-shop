# frozen_string_literal: true

class DealItem < ApplicationRecord
  belongs_to :item
  belongs_to :deal
end
