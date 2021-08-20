class BuyShippingaddress
  include ActiveModel::Model
  attr_accessor :postalcode, :area_id, :municipalities, :address, :building, :phone, :user_id, :item_id

  with_options presence: true do
    validates :postalcode
    validates :municipalities
    validates :address
    validates :phone
  end

  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Shippingaddress.create(postalcode: postalcode, area_id: area_id, municipalities: municipalities, address: address,
                           building: building, phone: phone, buy_id: buy.id)
  end
end
