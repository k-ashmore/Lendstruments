class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, length: { in: 2..60 }
  validates :details, presence: true, length: { maximum: 200 }
  validates :category, presence: true
  validates :pickup_location, presence: true
  validates :daily_rate, presence: true
  validates :daily_rate, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 100_000 }
  has_one_attached :photo
  validates :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_details,
                  against: [:name, :details, :category],
                  using: {
                    tsearch: { prefix: true }
                  }
end
