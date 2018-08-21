class SavedPlacesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @place = Place.find(params[:place_id])
    @saved_place = current_user.saved_places.build(place: @place)
    # binding.pry
    if @saved_place.save
      flash[:notice] = "Ajoutée dans mes favoris !"
    else
      flash[:alert] = "Vous avez déjà ajouté cette adresse !"
    end
    redirect_to place_path(@place)
  end

  def destroy
    @saved_place = SavedPlace.find(params[:place_id])

    if @saved_place.destroy
      flash[:notice] = "Adresse #{@saved_place.place.name} bien retirée de mes favoris !"
    else
      flash[:alert] = "Échec de la suppression !"
    end
      redirect_to user_path
  end
end
