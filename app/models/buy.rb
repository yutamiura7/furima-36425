class Buy < ApplicationRecord
  has_one :shippingaddress
  belongs_to :item
  belongs_to :user
end
