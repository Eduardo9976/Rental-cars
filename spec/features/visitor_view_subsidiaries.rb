require 'rails_helper'

feature 'Visitor view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'34567890102112', address:'Rua Santo Antonio')
    Subsidiary.create!(name:'Pinheiros Car', cnpj:'34567890109639', address:'Rua dos Pinheiros')
    
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Morumbi Car')
    expect(page).to have_content('Pinheiros Car')
  end

  scenario 'and no sibsidiares are created' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'34567890102112', address:'Rua Santo Antonio')
    Subsidiary.create!(name:'Pinheiros Car', cnpj:'3456456789123', address:'Rua dos Pinheiros')

    visit root_path
    click_on 'Filiais'
    click_on 'Morumbi Car'

    expect(page).to have_content('Morumbi Car')
    expect(page).not_to have_content('Pinheiros Car')
  end
  
  scenario 'and no subsidiares are created' do
    visit root_path
    click_on 'Filiais'

  expect(page).to have_content('Nenhum fabricante cadastrado')
  end
  
  scenario 'and return to home page' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'34567890102112', address:'Rua Santo Antonio')
    Subsidiary.create!(name:'Pinheiros Car', cnpj:'34564567891236', address:'Rua dos Pinheiros')

    visit root_path
    click_on 'Filiais'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
  
  scenario 'and return subsidiaries page' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'34567890102112', address:'Rua Santo Antonio')
    Subsidiary.create!(name:'Pinheiros Car', cnpj:'3456456789123', address:'Rua dos Pinheiros')

    visit root_path
    click_on 'Filiais'
    click_on 'Pinheiros Car'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end  
    
end