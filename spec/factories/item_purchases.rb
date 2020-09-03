FactoryBot.define do
  factory :item_purchase do
    token           {'whook_724bc36fff4c1ed8349eadfddb'}
    postal_code     {'123-4567'}
    prefecture_id   { 1 }
    city            { '東京都' }
    house_number    { '1-1' }
    building_name   { '東京ハイツ' }
    phone_number    { '09012345678' }
  end
end
