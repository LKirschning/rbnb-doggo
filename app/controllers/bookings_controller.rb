class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @dog = Dog.find(params[:dog_id])
    @booking.dog = @dog
    @booking.user = @user
    if @booking.save

      redirect_to dashboard_path, notice: "Yay you made a booking!"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:beginning, :end, :user)
  end
end
