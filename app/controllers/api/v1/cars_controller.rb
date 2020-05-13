class Api::V1::CarsController < Api::V1::ApiController
  def index
    @cars = Car.available
    render json: @cars.as_json(exclude: [:created_at, :update_at])
  end

  def show
    @car = Car.find(params[:id])
    render json: @car

  rescue ActiveRecord::RecordNotFound
    render json: 'Carro não encontrado', status: :not_found
  end  
end  