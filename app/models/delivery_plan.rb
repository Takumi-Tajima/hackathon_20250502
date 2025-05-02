class DeliveryPlan < ApplicationRecord
  extend Enumerize

  enumerize :delivery_frequency, in: {
    weekly: 'weekly',
    biweekly: 'biweekly',
    triweekly: 'triweekly',
    monthly: 'monthly',
  }, scope: true, predicates: true

  validates :name, presence: true
  validates :delivery_frequency, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :maximum_plans_limit

  scope :published, -> { where(published: true) }

  def weekly?
    delivery_frequency == 'weekly'
  end

  def biweekly?
    delivery_frequency == 'biweekly'
  end

  def triweekly?
    delivery_frequency == 'triweekly'
  end

  def monthly?
    delivery_frequency == 'monthly'
  end

  scope :default_order, -> { order(created_at: :desc) }

  def delivery_frequency_text
    I18n.t("enumerize.delivery_plan.delivery_frequency.#{delivery_frequency}")
  end

  def delivery_interval_days
    case delivery_frequency
    when 'weekly'
      7
    when 'biweekly'
      14
    when 'triweekly'
      21
    when 'monthly'
      28
    end
  end

  private

  def maximum_plans_limit
    return unless DeliveryPlan.count >= 3 && !persisted?

    errors.add(:base, '配送プランは最大3つまでしか作成できません')
  end
end
