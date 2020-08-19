FactoryBot.define do
  factory :user do
    nickname            {"fuji"}
    email               {'fff@gmail.com'}
    password            {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name         { '藤田' }
    first_name          { '敏弥' }
    family_name_reading { 'フジタ' }
    first_name_reading  { 'トシヤ' }
    birthday            {Faker::Date.between(from: '1930-01-01', to: '2010-12-31')}
  end
end