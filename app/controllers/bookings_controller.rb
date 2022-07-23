class BookingsController < ApplicationController
  # code in silo so as you make a new page make a new method
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end
end
