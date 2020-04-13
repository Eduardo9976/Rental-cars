require 'rails_helper'

feature 'Visitor view carcategories' do
  scenario 'successfully' do
    visit  root_path
    click_on 'Categorias carros'

  expect(page).to have_content('HTML index')  
  end
end