class Purchase < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: { money: true, greater_than_or_equal_to: 0 }

  belongs_to :user
  has_and_belongs_to_many :catagories
end
