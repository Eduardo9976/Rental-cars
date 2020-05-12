FactoryBot.define do 
  factory :user do
    sequence(:email) {  |n| "teste#{n}@teste.com.br" }
    password { '12345678' }
  end   
end