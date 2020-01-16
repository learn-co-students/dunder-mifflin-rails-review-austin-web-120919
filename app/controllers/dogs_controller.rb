class DogsController < ApplicationController
  before_action :set_dog, only: [:show]

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params(:name,:breed,:age))
    if @dog.valid?
      @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def show
  end

  private

  def dog_params(*args)
    params.require(:dog).permit(*args)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
