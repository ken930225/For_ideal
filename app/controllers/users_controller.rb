class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @workouts = @user.workouts.page(params[:page]).reverse_order
    @workout = Workout.new
    @events = Event.where(user_id: @user.id)
    @event = Event.new
  end

  def index
    @users = User.all
    @workout = Workout.new
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "successfully updated user!"
    else
      render "edit"
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :objective, :introduction, :profile_image)
  end

  def ensure_correct_user
    @workout = Workout.find(params[:id])
    unless @workout == current_user
      redirect_to user_path(current_user)
    end
  end
end
