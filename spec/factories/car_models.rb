FactoryBot.define do
  factory :car_model do
    name { 'Uno' }
    car_category
    manufacturer
    fuel_type {'flex'}
    motorization {'2.0'}
    year {'2020'}
  end
end