require 'rails_helper'

describe 'car management' do
  context 'index' do
    it 'renders available cars' do
      cars = create_list(:car,3, status: :available)
      rented_car = create(:car, status: :rented)


      get api_v1_cars_path
      
      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')
      expect(response_json.count).to eq(3)
      expect(response_json[0][:license_plate]).to eq(cars.first.license_plate)
      expect(response_json[0][:color]).to eq(cars.first.color)
      expect(response_json[0][:mileage]).to eq(cars.first.mileage)
      expect(response_json[0][:car_model_id]).to eq(cars.first.car_model_id)
      expect(response_json[1][:license_plate]).to eq(cars.second.license_plate)
      expect(response_json[2][:license_plate]).to eq(cars.third.license_plate)
      expect(response.body).to_not include(rented_car.license_plate)
    end
    it 'renders empty json' do
      get api_v1_cars_path

      response_json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')
      expect(response_json).to be_blank
    end  
  end  
  context 'GET /car/:id' do
    context 'record exists' do
      let(:car) { create(:car)}
      
      before { get api_v1_cars_path(car.id) }
      
      it 'return status code' do
        expect(response).to have_http_status(:ok)
      end  
      
      it 'return only one record' do
        response_json = JSON.parse(response.body, symbolize_names: true)
        expect(response_json[0][:id]).to eq(car.id)
        expect(response_json[0][:license_plate]).to eq(car.license_plate)
        expect(response_json[0][:color]).to eq(car.color)
      end  
    end  
  end
  context 'when record not exists' do
    
    before { get api_v1_car_path(id:1000) }
    
    it 'return status code 404' do
      expect(response).to have_http_status(:not_found)
    end  
    
    it 'return not found' do
      expect(response.body).to include('Carro não encontrado')
    end
  end      
end