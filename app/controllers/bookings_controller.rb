class BookingsController < ApplicationController
  before_action :set_company, only: [:open_booking]

  def create
    booking = Booking.create!(params)
    render json: {status: :ok, message: 'Created Succcessfully', data: booking }
  end

  def open_booking
    render json: {status: :ok, company: @company, services: @company.services, booking: @company.bookings }
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def booking_params
      params.permit(:customer_id, :company_id, :booked_at, :services)
    end
end
