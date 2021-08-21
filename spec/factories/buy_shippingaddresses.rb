FactoryBot.define do
  factory :buy_shippingaddress do
    postalcode { '123-4567' }
    area_id { 2 }
    municipalities { '青森市' }
    address { '1-1' }
    building { '青森ハイツ' }
    phone { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
