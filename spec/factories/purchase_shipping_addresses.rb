FactoryBot.define do
  factory :purchase_shipping_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '市区町村' }
    address { 111 }
    building_name { '建物名' }
    tel { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
