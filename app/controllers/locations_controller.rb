class LocationsController < ApplicationController
  def index
    @locations = Location.where(validated: true)
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
    authorize @location
  end

  # create needs admin approval
  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@restaurant)
    else
    render :new
    end
  end


  def edit
    @location = Location.find(params[:id])
  end

  # update and destroy needs to be admin only
  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    redirect_to location_path
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to root_path
  end

  private

  def location_params
    params.require(:location).permit(:name, :description, :website, :email, :street, :city, :postcode,
    :location_category, :validated, :wheelchair_access, :step_free_access, :automatic_doors, :disabled_parking,
    :accessible_toilets, :latitude, :longitude, :photo)

  end

end
