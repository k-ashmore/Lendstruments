class BookingsController < ApplicationController
  # code in silo so as you make a new page make a new method
  def new
    @booking = Booking.new
    @item = Item.find(params[:item_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @item = Item.find(params[:item_id])
    @booking.item = @item

    if @booking.save
      redirect_to @booking, notice: 'Booking request was successfully created.'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
