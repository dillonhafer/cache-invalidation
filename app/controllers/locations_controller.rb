class LocationsController < ApplicationController
  def update
    l = Location.find(params[:id])
    l.update_attributes(location_params)
    redirect_to :back
  end

  def location_params
    params.require(:location).permit(:name)
  end
end
