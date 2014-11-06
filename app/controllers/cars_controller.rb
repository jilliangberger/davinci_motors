class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  def index
    @cars = Car.all
  end

  def edit
  end

  def destroy
  end

  def update
    @car.update(car_params)
    if @car.save
      redirect_to cars_path,
      notice: "#{@car.year} #{@car.make} #{@car.model} #{@car.price} updated"
    end
  end

  def new
    @car = Car.new
  end

  def create
  @car = Car.new(car_params)
    if @car.save
    redirect_to cars_path,
    notice: "#{@car.year} #{@car.make} #{@car.model} #{@car.price} created"
    end
  end

  def show
    @car = Car.all
  end

  private
  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:year, :make, :model, :price)
  end
end
