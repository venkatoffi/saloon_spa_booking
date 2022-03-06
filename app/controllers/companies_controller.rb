class CompaniesController < ApplicationController

  def index
    company = Company.all
    render json: {count: company.count, company: company }
  end

  def create
    raise 'Gst Number is not valid:status:404' unless params[:gst_in][2..-4] == params[:pan]
    company = Company.new
    company.create_company(company_params)
    render json: {status: :ok, message: 'Created Succcessfully', data: company }
  end

  private
    def company_params
      params.permit(:name, :gst_in, :pan, :address, :chairs, :working_hours)
    end
end
