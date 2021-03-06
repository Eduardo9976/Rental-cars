require 'rails_helper'

feature "Admin register new car" do
  scenario "Succefully" do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: '50', insurance: '20',
                                third_insurance: '20')
    car_model = CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: cat_a, 
                            fuel_type: 'flex', motorization:'2.0', year: '2018')
            
    
    login_as user, scope: :user  
    visit root_path
    click_on "Carros"
    click_on "Registrar novo carro"
    fill_in 'Placa', with: 'CWO-0109'
    fill_in 'Cor', with: '2020'
    fill_in 'Quilometragem', with: 102000
    select car_model.name, from: 'Modelo do carro'
    click_on 'Enviar'
    

    expect(page).to have_content('Cadastrado com sucesso')
    expect(page).to have_content('CWO-0109')
    expect(page).to have_content('2020')
    expect(page).to have_content(102000)
    expect(page).to have_content('Mobi')
    expect(page).to have_content('Voltar')
  end
end