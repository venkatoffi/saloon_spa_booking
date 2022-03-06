class ServicesController < ApplicationController

  def create
    raise 'This Service Already Present for current saloonsatus:404' unless !Service.find_by(name: params[:name], company_id: params[:company_id])
    service = Service.create!(service_params)
    render json: {status: :ok, message: 'Created Succcessfully', data: service }
  end

  private
    def service_params
      params.permit(:name, :company_id, :duration, :price)
    end
end
