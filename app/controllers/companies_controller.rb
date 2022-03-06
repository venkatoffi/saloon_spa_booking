class CompaniesController < ApplicationController

  def index
    company = Company.all
    render json: {company: company }
  end

  def create
     # ["id", "name", "gst_in", "pan", "address", "chairs", "working_hours", "created_at", "updated_at"]
     company_params

  end

  private
    def company_params
      params.require(:pan).permit(:name, :gst_in, :address, :chairs, :working_hours)
    end
end
