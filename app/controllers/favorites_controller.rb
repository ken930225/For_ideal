class FavoritesController < ApplicationController

  def create
    @workout = Workout.find(params[:workout_id])
    favorite = current_user.favorites.new(workout_id: @workout.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @workout = Workout.find(params[:workout_id])
    favorite = current_user.favorites.find_by(workout_id: @workout.id)
    favorite.destroy
    redirect_to request.referer
  end
end
