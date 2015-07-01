module Account
  class ProfilesController < ApplicationController
    before_action :authenticate_user!
    skip_after_action :verify_authorized

    def show
      @locations  = current_user.locations
      @reviews    = current_user.reviews
    end
  end
end
