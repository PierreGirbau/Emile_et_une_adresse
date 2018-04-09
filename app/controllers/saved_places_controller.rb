class SavedPlacesController < ApplicationController

  def delete_saved_place
    @saved_place = SavedPlace.find(params[:saved_place_id])
    @saved_place.visible = "false" if @saved_place.visible = "true"
    redirect_to places_path
  end
end
