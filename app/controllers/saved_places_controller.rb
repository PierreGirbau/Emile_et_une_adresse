class SavedPlacesController < ApplicationController

  def delete_saved_place
    @saved_place = SavedPlace.find(params[:saved_place_id])
    @saved_place.visible = "false" if @saved_place.visible = "true"
    respond_to do |format|
      format.html { redirect_to places_path }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end
end
