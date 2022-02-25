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
<<<<<<< HEAD

      redirect_to dashboard_path, notice: "Yay you made a booking!"
=======
      redirect_to dog_path(@dog)
>>>>>>> 5d23d90266cac89f9055bedf2ea3889d1809b16f
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:beginning, :end, :user)
  end
end
