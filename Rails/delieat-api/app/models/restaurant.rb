class Restaurant < ApplicationRecord
  belongs_to :owner

  has_one :menu
  has_one :address
  has_one :campus
end
