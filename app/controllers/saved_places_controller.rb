class SavedPlacesController < ApplicationController

  def create
    @place = Place.find(params[:place_id])
    @saved_place = current_user.saved_places.build(place: @place)
    # binding.pry
    if @saved_place.save
      flash[:notice] = "Enregistrée dans -mes adresses-"
    else
      flash[:alert] = "Vous l'avez déjà dans vos adresses préférées :)"
    end
    redirect_to place_path(@place)
  end

  def destroy
    @saved_place = SavedPlace.find(params[:place_id])

    if @saved_place.destroy
      flash[:notice] = "Etablissement #{@saved_place.place.name} bien enlevé de -mes adresses-"
    else
      flash[:alert] = "Echec de la suppression!"
    end
      redirect_to user_path
  end
end
