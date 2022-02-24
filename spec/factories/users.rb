FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name_kanji {"田中"}
    first_name_kanji {"太郎"}
    last_name_katakana {"タナカ"}
    first_name_katakana {"タロウ"}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end