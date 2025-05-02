class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  has_many :addresses, dependent: :destroy
  has_many :user_plans, dependent: :destroy
  has_many :delivery_plans, through: :user_plans
end
