require 'rails_helper'

feature 'Edit subsidiary' do
  scenario 'succefully' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'34567890102112', address:'Rua Santo Antonio')

    visit root_path
    click_on 'Filiais'
    click_on 'Morumbi Car'
    click_on 'Editar'
    fill_in 'Nome', with: 'RR Cars'
    fill_in 'Endereço', with: 'Rua General Rails'
    click_on 'Enviar'

    expect(page).to have_content('RR Cars')
  end

  scenario 'succefully' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'34567890102112', address:'Rua Santo Antonio')

    visit root_path
    click_on 'Filiais'
    click_on 'Morumbi Car'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('O campo não pode ficar em branco')
  end

  scenario 'succefully' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'34567890102112', address:'Rua Santo Antonio')
    visit root_path
    click_on 'Filiais'
    click_on 'Morumbi Car'
    click_on 'Editar'
    fill_in 'CNPJ', with: '123'
    click_on 'Enviar'

    expect(page).to have_content('is the wrong length (should be 14 characters)')
  end  

end