class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :start_date, :date => { :after => Time.now, :before => Time.now + 1.year }
  validates :end_date, :date => { :after => Time.now, :before => Time.now + 1.year }
  validates :status, presence: true

  def pending?
    status == 'Pending'
  end
end
