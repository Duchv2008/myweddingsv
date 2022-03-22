class WeddingGuest < ApplicationRecord
  validates :gender, inclusion: { in: %w(male female secret), message: "%{value} is not a valid size" },
    allow_nil: true

  validates :email, email: true, allow_nil: true
  validates :phone, :length => { :minimum => 10, :maximum => 15 }, allow_nil: true

  belongs_to :wedding
end
