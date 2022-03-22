class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :weddings, foreign_key: :owner_id, class_name: "Wedding"
end
