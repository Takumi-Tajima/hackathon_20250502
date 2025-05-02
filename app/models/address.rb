class Address < ApplicationRecord
  include JpPrefecture
  jp_prefecture :region

  belongs_to :user

  validates :region, presence: true
  validates :detail, presence: true
  validates :is_primary, inclusion: { in: [true, false] }

  scope :primary, -> { find_by(is_primary: true) }
end
