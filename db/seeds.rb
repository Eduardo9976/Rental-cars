user = User.create!(email: 'teste@teste.com.br', password:'12345678')

car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:100, 
                                third_insurance: 100)

fiat = Manufacturer.create!(name: 'Fiat')
car_model = CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: car_category, fuel_type: 'flex', 
                          motorization: '2.0', year: '2020')

car = Car.create!(license_plate: 'ABC-1234', mileage: 1000, color: 'Azul', car_model: car_model, status: :available) 

customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-02',
                          email: 'teste@teste.com.br')
                          
rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
            customer: customer, car_category: car_category)