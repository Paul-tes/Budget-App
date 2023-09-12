class User < ApplicationRecord
  validates :name, presence: true

  has_many :categories, dependent: :destroy
  has_many :purchases, foreign_key: :author_id, dependent: :destroy
end
