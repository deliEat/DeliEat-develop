class Restaurant < ApplicationRecord
  belongs_to :owner

  has_many :menu
  has_one :address
  has_one :campus

  validates_presence_of :owner
end
