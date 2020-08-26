class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
    @workout = Workout.new
  end

  def show
    @workout = Workout.find(params[:id])
    @workout_new = Workout.new
    @workout_comment = WorkoutComment.new
    @workout_comments = @workout.workout_comments
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    if @workout.save
      redirect_to workout_path(@workout), notice: "You have created book successfully."
    else
      @workouts = Workout.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to workout_path(@workout), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to workouts_path
  end

  def workout_params
    params.require(:workout).permit(:place, :menu, :target, :count)
  end
end
