class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @workouts = @user.workouts
    @workout = Workout.new
  end

  def index
    @users = User.all
    @workout = Workout.new
  end

  def edit
<<<<<<< HEAD
  end

  def update
=======
   @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
>>>>>>> 19cc48fb1bcad4429eb1697eab218d40dcef60d7
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "successfully updated user!"
    else
      render "edit"
    end
  end

<<<<<<< HEAD
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
=======
  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to user_path(User.find(params[:id]))
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :objective, :introduction, :profile_image)
>>>>>>> 19cc48fb1bcad4429eb1697eab218d40dcef60d7
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
