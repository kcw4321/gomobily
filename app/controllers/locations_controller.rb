class LocationsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @locations= policy_scope(Location)
    #@locations =Location.all
    if params[:category].present?
      @locations = Location.paginate(:page => params[:page], :per_page => 10).where(location_category: params[:category])
    else
      @locations = Location.all.paginate(:page => params[:page], :per_page => 10)

    end
    # if params[:category].present? || params[:name].present?
    #   @locations = Location.where(name: params[:name], location_category: params[:category])
    # else
    #   @locations = Location.all.paginate(page: params[:page], per_page: 10)
    # end

    @markers = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude

    end

    @markers.reject! do |marker|
      marker[:lat].blank? || marker[:lng].blank?
    end
    authorize @locations
  end

  # def select
  #   @location = Location.find(params[:id])
  #   authorize @location
  #   @location.destroy
  #   redirect_to root_path
  # end

  def show
    @location = Location.find(params[:id])
    authorize @location


    @markers = Gmaps4rails.build_markers(@location) do |location, marker|
    marker.lat location.latitude
    marker.lng location.longitude
    end

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
