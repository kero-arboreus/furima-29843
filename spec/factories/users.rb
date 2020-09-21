FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    Faker::Config.locale = :ja
    first_name { Faker::Name.last_name }
    last_name { Faker::Name.first_name }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    birth { '1990-01-01' }
  end
end
