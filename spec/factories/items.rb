FactoryBot.define do
  factory :item do
    name              { '富士山' }
    introduction      { '日本一の山です' }
    category_id       { 1 }
    condition_id      { 1 }
    postage_type_id   { 1 }
    ship_area_id      { 1 }
    ship_days_id      { 1 }
    price             { 2000 }
    association :user
  end
end
