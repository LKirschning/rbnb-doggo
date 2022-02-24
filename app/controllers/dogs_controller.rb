class DogsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :index  ]

  def index
    @dogs = Dog.all
  end

  def show
     @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @user = current_user
    @dog = Dog.new(dog_params)
    @dog.user = @user
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
    params.require(:dog).permit(:price, :name, :gender, :breed, :age, :size, :description, :image)
  end

end
