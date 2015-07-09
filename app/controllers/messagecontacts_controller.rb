class MessagecontactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  skip_after_action :verify_policy_scoped, only: [:create]

  def new
    @messagecontact = Messagecontact.new
  end

  def index
    @messagecontact = Messagecontact.all
  end


  def create
    @messagecontact = Messagecontact.new(messagecontact_params)

    if @messagecontact.save
      redirect_to root_path
    else
      render :new
    end

    authorize @messagecontact
  end

  def show
    @messagecontact = Messagecontact.find(params[:id])
  end

  private


  def messagecontact_params
    params.require(:messagecontact).permit(:title, :description, :email, :city, :telephone)
  end


end
