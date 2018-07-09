class Menu < ApplicationRecord
  has_many :menu_items
  belongs_to :restaurant

  validates_presence_of :restaurant
end
