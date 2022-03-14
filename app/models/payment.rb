class Payment < ApplicationRecord

  belongs_to :user
  belongs_to :group

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

end