class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :meal_ket

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :meal_ket_must_be_published

  def subtotal
    price * quantity
  end

  private

  def meal_ket_must_be_published
    unless meal_ket&.published?
      errors.add(:meal_ket, 'は現在販売していません')
    end
  end
end
