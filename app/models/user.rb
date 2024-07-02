# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :orders, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
end
