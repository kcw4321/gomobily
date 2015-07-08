class LocationsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @locations = policy_scope(Location)
    @categorytype = params[:categorytype]
    @category = params[:category]

    if params[:category].present?
      @locations = Location.paginate(:page => params[:page], :per_page => 10).where(location_category: params[:category])

    elsif params[:name].present?
      @locations = Location.paginate(:page => params[:page], :per_page => 10).where(name: params[:name])
    else
      @locations = Location.all.paginate(:page => params[:page], :per_page => 10)
    end


    @locations = @locations.where(wheelchair_access: true) if params.has_key? :wheelchair_access
    @locations = @locations.where(step_free_access: true) if params.has_key? :step_free_access
    @locations = @locations.where(automatic_doors: true) if params.has_key? :automatic_doors
    @locations = @locations.where(disabled_parking: true) if params.has_key? :disabled_parking
    @locations = @locations.where(accessible_toilet: true) if params.has_key? :accessible_toilet



    @markers = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow view_context.link_to(location.name, location_path(location))
    end

    @markers.reject! do |marker|
      marker[:lat].blank? || marker[:lng].blank?
    end
    authorize @locations
  end

  # marker.picture { :picture => <marker-picture-file-path> })
  # marker.json({ :id => user.id })

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
