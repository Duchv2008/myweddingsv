class Checklist < ApplicationRecord
  belongs_to :wedding, optional: true
  belongs_to :service

  enum status: {pending: "pending", completed: "completed"}, _default: "pending"
end
