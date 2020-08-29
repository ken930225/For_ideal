class WorkoutCommentsController < ApplicationController

  def create
    @workout = Workout.find(params[:workout_id])
    @workout_comment = current_user.workout_comments.new(workout_comment_params)
    @workout_comment.workout_id = @workout.id
    if @workout_comment.save
      flash[:success] = "Comment was successfully created."
    end
    redirect_to request.referer
  end

  def destroy
    @workout = Workout.find(params[:workout_id])
    workout_comment = current_user.workout_comments.find_by(id: params[:id], workout_id: @workout.id)
    workout_comment.destroy
    redirect_to request.referer
  end

  private

  def workout_comment_params
    params.require(:workout_comment).permit(:comment)
  end
end
