class UserPlan < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :delivery_plan

  enumerize :status, in: {
    active: 'active',
    canceled: 'canceled',
  }, scope: true, predicates: true, default: :active

  scope :default_order, -> { order(created_at: :desc) }

  validates :status, presence: true
end
