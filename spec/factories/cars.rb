FactoryBot.define do 
  factory :car do
    sequence(:license_plate) { |n| "ENS-767#{n}"}
    color {'Black'} 
    sequence(:mileage) { |n| "100#{n}"}
    car_model
  end   
end