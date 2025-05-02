class Order < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :user_plan
  has_many :order_items, dependent: :destroy
  has_many :meal_kets, through: :order_items

  enumerize :status, in: {
    pending: 'pending',
    confirmed: 'confirmed',
    canceled: 'canceled',
  }, scope: true, predicates: true, default: :pending

  validates :delivery_date, presence: true
  validates :status, presence: true
  validate :delivery_date_must_be_future
  validate :user_must_have_active_plan

  scope :default_order, -> { order(delivery_date: :desc) }

  def total_price
    order_items.sum { |item| item.price * item.quantity }
  end

  private

  def delivery_date_must_be_future
    return if delivery_date.blank?

    if delivery_date < Date.current
      errors.add(:delivery_date, '配送日は今日以降の日付を指定してください')
    end
  end

  def user_must_have_active_plan
    unless user_plan&.active?
      errors.add(:base, '有効な配送プランがありません')
    end
  end
end
