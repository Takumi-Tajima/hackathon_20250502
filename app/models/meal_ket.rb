class MealKet < ApplicationRecord
  include Publishable

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :is_frozen, inclusion: { in: [true, false] }

  scope :default_order, -> { order(created_at: :desc) }
end
