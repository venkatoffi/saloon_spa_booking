class Company < ApplicationRecord
	has_many :bookings
	has_many :services
  validates :gst_in, presence: true, uniqueness:{
    message: 'Gst IN is Already Registered !'
  }

  def create_company(company_obj)
    ActiveRecord::Base.transaction do
      if save
        Company.create!(company_obj)
      else
        raise "Company Creation failed - #{errors.full_messages.join(',')}:status:404"
      end
    end
  end
end