require 'rails_helper'

describe 'car management' do
  context 'index' do
    it 'renders available cars' do
      cars = create_list(:car,3, status: :available)
      rented_car = create(:car, status: :rented)


      get api_v1_cars_path
      
      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      #expect(response.content_type).to eq('application/json')
      expect(response_json.count).to eq(3)
      expect(response_json[0][:license_plate]).to include(cars.first.license_plate)
      expect(response_json[1][:license_plate]).to include(cars.second.license_plate)
      expect(response_json[2][:license_plate]).to include(cars.third.license_plate)
      expect(response.body).to_not include(rented_car.license_plate)
      

    end
    it 'renders empty json' do
      get api_v1_cars_path

      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')
      expect(response_json).to be_blank
    end  
  end
end