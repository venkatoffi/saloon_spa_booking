class BookingsController < ApplicationController

  def create
    booking = Booking.create!(params)
    render json: {status: :ok, message: 'Created Succcessfully', data: booking }
  end

  private
    def booking_params
      params.permit(:customer_id, :company_id, :booked_at, :services)
    end
end
