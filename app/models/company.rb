class Company < ApplicationRecord
	has_many :bookings
	has_many :services
end