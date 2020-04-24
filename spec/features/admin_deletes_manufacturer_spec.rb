require 'rails_helper'

feature 'Admin deletes manufacturer' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '12345678')
    Manufacturer.create!(name: 'Fiat')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Apagar fabricante'

    expect(current_path).to eq manufacturers_path
    expect(page).to have_content('Nenhum fabricante cadastrado')
  end

  scenario 'and keep anothers' do
    user = User.create!(email: 'test@test.com', password: '12345678')
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Honda')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Apagar fabricante'

    expect(current_path).to eq manufacturers_path
    expect(page).not_to have_content('Fiat')
    expect(page).to have_content('Honda')
  end
end
