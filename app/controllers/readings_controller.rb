class ReadingsController < ApplicationController

  def index
    @readings = if params[:term]
      Reading.where("name LIKE '%#{params[:term]}%' or author LIKE '%#{params[:term]}%'" )
    else
      @readings = Reading.all
    end
  end

  def new
    @reading = Reading.new
  end

  def create
    @reading = Reading.new(reading_params)
    if @reading.save
      redirect_to readings_path
    else
      render :new
    end
  end

  def edit
    @reading = Reading.find(params[:id])
  end

  def update
    @reading = Reading.find(params[:id])
    if @reading.update(reading_params)
      redirect_to readings_path
    else
      render :edit
    end
  end

  def destroy
    Reading.destroy(params[:id])
    redirect_to readings_path
  end

  def show
    @reading = Reading.find(params[:id])
  end

  # def readit
  #   @reading = Reading.find(params[:id])
  #   @reading.toggle(:completed).save
  #   redirect_to readings_path
  # end

  def read
      @reading = Reading.find(params[:id])
      @reading.toggle(:completed).save
      redirect_to readings_path
  end

  def unread
      @reading = Reading.find(params[:id])
      @reading.toggle(:completed).save
      redirect_to readings_path
  end

  private

  def reading_params
    params.require(:reading).permit(:name, :author, :completed, :term)
  end

end
