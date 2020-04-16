require 'rails_helper'
feature 'Admin visit car model' do
  scenario 'succefully' do
    
    visit root_path
    click_on 'Modelos de Carros'

    expect(page).to have_content('Voltar')
  end

  scenario 'succefully' do 
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 50, insurance: 20, third_insurance: 20)

    visit root_path
    click_on 'Modelos de Carros'
    click_on 'Cadastrar novo modelo de carro'

    fill_in 'Nome', with: 'Mobi' 
    fill_in 'Combustível', with: 'Flex'
    fill_in 'Motor', with: '1.6'
    fill_in 'Ano', with: '2010'
    click_on 'Enviar'

    expect(page).to have_content('Voltar')
    expect(page).to have_content('Apagar')
    expect(page).to have_content('Editar')
  end      
end