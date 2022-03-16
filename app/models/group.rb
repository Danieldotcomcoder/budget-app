class Group < ApplicationRecord
  belongs_to :user
  has_many :payments

  validates :name, presence: true
  validates :icon, presence: true

  def total_payments
    payments.sum(:amount)
  end
end
