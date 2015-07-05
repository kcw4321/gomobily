class LocationsController < ApplicationController
  def index
    @locations = policy_scope(Location)

    # if params[:name] || params[:category]
    #   @locations = @locations.where(name: params[:name]) || @locations.where(category: params[:category])
    # end

    if params[:category]
      @locations = @locations.where(location_category: params[:category])
    end


    @locations = Location.all.paginate(page: params[:page], per_page: 10)

    # if params[:wheelchair_access] || params[:step_free_access] || params[:automatic_doors] || params[:disabled_parking || params[:accessible_toilets]
    #   @locations = @locations.where(step_free_access: params[:step_free_access]) || @locations.where(wheelchair_access: params[:wheelchair_access]) || @locations.where(disabled_parking: params[:disabled_parking]) || @locations.where(accessible_toilets: params[:accessible_toilets])
    # end

      @markers = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
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
