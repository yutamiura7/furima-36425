FactoryBot.define do
  factory :item do
    itemname { '商品名' }
    text { '商品説明' }
    category_id { 2 }
    status_id { 2 }
    load_id { 2 }
    area_id { 2 }
    shippingday_id { 2 }
    price { '300' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
