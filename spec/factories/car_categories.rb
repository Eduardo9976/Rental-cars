FactoryBot.define do 
  factory :car_category do
    sequence(:name) {  |n| "Categoria #{n}" }
    daily_rate { 100 }
    insurance { 100 }
    third_insurance { 100 }
  end   
end