require 'rails_helper'

feature 'User visit locked path' do
  scenario "No access" do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: '50', insurance: '20',
                                third_insurance: '20')
    car_model = CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: cat_a, 
                            fuel_type: 'flex', motorization:'2.0', year: '2018')
            
    
    visit car_model_path(car_model)
    
    expect(page).to have_content('Para continuar, efetue login ou registre-se')
    expect(current_path).to eq(new_user_session_path)
  end
  scenario 'other locked access' do
    visit manufacturers_path
    
    expect(page).to have_content('Para continuar, efetue login ou registre-se')
    expect(current_path).to eq(new_user_session_path)
  end  
end