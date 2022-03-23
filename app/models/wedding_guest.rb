class WeddingGuest < ApplicationRecord
  validates :gender, inclusion: { in: %w(male female secret), message: "%{value} is not a valid size" },
    allow_nil: true

  # validates :email, email: true, allow_nil: true
  validates :phone, :length => { :minimum => 10, :maximum => 15 }, allow_nil: true

  enum join_status: { confirmed: "confirmed", pending: "pending", cancelled: "cancelled"}, _default: "pending"

  belongs_to :wedding
end
