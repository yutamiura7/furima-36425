class BuyShippingaddress
  include ActiveModel::Model
  attr_accessor :postalcode, :area_id, :municipalities, :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :municipalities
    validates :address
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone, format: { with: /\A\d{10,11}\z/ }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Shippingaddress.create(postalcode: postalcode, area_id: area_id, municipalities: municipalities, address: address,
                           building: building, phone: phone, buy_id: buy.id)
  end
end
