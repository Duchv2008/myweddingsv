class Wedding < ApplicationRecord
  belongs_to :user, foreign_key: "owner_id", class_name: "User"

  validates :owner_gender, inclusion: { in: %w(male female secret), message: "%{value} is not a valid size" },
    allow_nil: true
  validates :partner_gender, inclusion: { in: %w(male female secret), message: "%{value} is not a valid size" },
    allow_nil: true

  # validates :partner_email, email: true, allow_nil: true
  validates :partner_phone, :length => { :minimum => 10, :maximum => 15 }, allow_nil: true

  has_many :wedding_guests, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :services
  has_many :checklists, dependent: :destroy
end
