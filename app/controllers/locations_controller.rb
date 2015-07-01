class LocationsController < ApplicationController
  def index
    @locations = policy_scope(Location)

    if params[:category]
      @locations = @locations.where(location_category: params[:category])
    end
  end

  def show
    @location = Location.find(params[:id])
    authorize @location
  end

  def new
    @location = Location.new
    authorize @location
  end

  # create needs admin approval
  def create
    @location = Location.new(location_params)
    authorize @location

    if @location.save
      redirect_to location_path(@restaurant)
    else
      render :new
    end
  end
  def edit
    @location = Location.find(params[:id])
    authorize @location
  end

  # update and destroy needs to be admin only
  def update
    @location = Location.find(params[:id])
    authorize @location
    @location.update(location_params)
    redirect_to location_path
  end

  def destroy
    @location = Location.find(params[:id])
    authorize @location
    @location.destroy
    redirect_to root_path
  end

  private

  def location_params
    params.require(:location).permit(:name, :description, :website, :email, :telephone, :street, :city, :postcode,
    :location_category, :validated, :wheelchair_access, :step_free_access, :automatic_doors, :disabled_parking,
    :accessible_toilets, :latitude, :longitude, :photo)
  end
end
