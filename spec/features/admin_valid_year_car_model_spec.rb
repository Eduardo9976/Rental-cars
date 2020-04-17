require 'rails_helper'

feature 'Admin valid fabrication year' do
  scenario 'year of manufacture must be less than or equal to the current year'do
    category = CarCategory.new(name: 'A', daily_rate: 10, insurance: 10,
                                  third_insurance: 10)
    manufacturer = Manufacturer.new(name: 'Honda')

    visit root_path
    click_on 'Modelos de Carros'
    click_on 'Cadastrar novo modelo'
    fill_in 'Nome', with: 'Civic'
    fill_in 'Combustível', with: 'flex'
    fill_in 'Motor', with: '1.6'
    fill_in 'Ano de fabricação', with: '2028' 
    click_on 'Enviar'
   
    expect(page).to have_content('Ano de fabricação incorreto')
  end
end     