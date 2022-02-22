class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    set_dog
  end

  def new
    @dog = Dog.new


  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end

  end

  def destroy
    @dog = set_dog
    @dog.delete
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:price, :name, :gender, :breed, :age, :size, :description)
  end



end