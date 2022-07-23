class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { in: 6..20 }
  validates :details, presence: true, length: { maximum: 200 }
  validates :category, presence: true
  validates :daily_rate, presence: true
  validates :daily_rate, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 100_000 }
  has_one_attached :photo
end
