class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @bookings = Booking.where(user_id:@user)

    @dogs = Dog.where(user_id:@user)

    # raise
  end

end
