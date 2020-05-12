class Api::V1::CarsController < Api::V1::ApiController
  def index
    @cars = Car.available
    render json: @cars.as_json(exclude: [:created_at, :update_at])
  end
end  