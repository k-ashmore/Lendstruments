class BookingsController < ApplicationController
  # code in silo so as you make a new page make a new method
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @bookings_as_owner = current_user.bookings_as_owner
  end

  def new
    @booking = Booking.new
    @item = Item.find(params[:item_id])
    authorize @item
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @item = Item.find(params[:item_id])
    @booking.item = @item
    authorize @item

    if @booking.save
      redirect_to bookings_path, notice: 'Booking request was successfully created.'
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      # redirect_to # up to you...
      redirect_to bookings_path
    else
      # render # where was the booking update form?
      render "index"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
