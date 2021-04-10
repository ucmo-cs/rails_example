class Api::V1::CarsController < ApplicationController

  # Get /cars
  def index
  	@cars = Car.all
  	render json: @cars
  end

  #Get /cars/:id
  def show
  	@car = Car.find(params[:id])
  	render json: @car
  end

  #Get /cars/make/:make
  def make
    @cars = Car.where(make: params[:make])
    render json: @cars
  end

  #POST /cars
  def create
  	@car = Car.new(car_params)
  	if @car.save
  		render json: @car
  	else
  		render error: { error: 'Unable to create Car.' }, status: 400
  	end
  end

  #PUT /cars/:id
  def update
  	@car = Car.find(params[:id])
  	if @car
  		@car.update(car_params)
  		render json: { message: 'Car successfully updated.' }, status: 200
  	else
  		render json: { error: 'Unable to update Car.' }, status: 400
  	end
  end

  #DELETE /cars/:id
  def destroy
  	@car = Car.find(params[:id])
  	if @car
  		@car.destroy
  		render json: { message: 'Car successfully deleted.' }, status: 200
  	else
  		render json: { error: 'Unable to delete car.' }, status: 400
  	end
  end

  private

  def car_params
  	params.permit(:id, :make, :model, :year)
  end

end
