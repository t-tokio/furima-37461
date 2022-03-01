FactoryBot.define do
  factory :item do
    item_name { "名前" }
    text { "説明" }
    category_id { 2 }
    item_state_id { 2 }
    shipping_cost_bearer_id { 2 }
    prefectures_id { 2 }
    shipping_days_id { 2 }
    price { 10000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
