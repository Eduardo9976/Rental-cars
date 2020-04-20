require 'rails_helper'

feature "Admin register new car" do
  scenario "Succefully" do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: '50', insurance: '20',
                                third_insurance: '20')
    car_model = CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: cat_a, 
                            fuel_type: 'flex', motorization:'2.0', year: '2018')
            
                            
    visit root_path
    click_on "Carros"
    click_on "Registrar novo carro"
    fill_in 'Placa', with: 'CWO-0109'
    fill_in 'Cor', with: '2020'
    fill_in 'Quilometragem', with: 102000
    select car_model.name, from: 'Modelo do carro'
    click_on 'Enviar'
    click_on 'Editar'

    fill_in 'Quilometragem', with: 10
    click_on 'Enviar'
    
    expect(page).to have_content('Mobi')  
    expect(page).to have_content('10')
   
  end
end