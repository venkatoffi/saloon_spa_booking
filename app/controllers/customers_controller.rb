class CustomersController < ApplicationController

  def index
    company = Customer.all
    render json: {count: company.count,company: company }
  end
end
