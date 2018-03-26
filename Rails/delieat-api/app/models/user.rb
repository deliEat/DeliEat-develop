class User < ApplicationRecord
  has_one :owner
  has_one :customer
end