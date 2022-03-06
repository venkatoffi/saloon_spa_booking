class CustomersController < ApplicationController

  def index
    company = Customer.all
    render json: {company: company }
  end
end
