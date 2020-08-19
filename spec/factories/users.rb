FactoryBot.define do
  factory :user do
    nickname            {"fuji"}
    email               {"fff@gmalil.com"}
    password            {"000000"}
    password_confirmation {password}
    family_name         { '藤田' }
    first_name          { '敏弥' }
    family_name_reading { 'フジタ' }
    first_name_reading  { 'トシヤ' }
    birthday            {"00000000"}
  end
end