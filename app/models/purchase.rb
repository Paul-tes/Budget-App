class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :amount, presence: true, numericality: { money: true, greater_than_or_equal_to: 0 }
end
