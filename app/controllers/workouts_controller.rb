class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @workouts = Workout.page(params[:page]).reverse_order
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
      redirect_to workout_path(@workout), notice: "You have created workout successfully."
    else
      @workouts = Workout.all
      render 'index'
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      redirect_to workout_path(@workout), notice: "You have updated workout successfully."
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
    params.require(:workout).permit(:place, :menu, :target, :count, :date, :weight, :set)
  end
  def ensure_correct_user
    @workout = Workout.find(params[:id])
    unless @workout.user == current_user
      redirect_to workouts_path
    end
  end
end
