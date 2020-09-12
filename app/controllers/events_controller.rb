class EventsController < ApplicationController
  def index
    @events = Event.where(user_id: current_user.id)
    @event = Event.new
  end
  def create
    @user = User.find(params[:event][:user_id])
    event = Event.new(event_params)
    event.save!
    @events = Event.where(user_id: current_user.id)
    redirect_to events_path(current_user)
  end

  def update
    event = Event.find(params[:id])
    @events = Event.where(user_id: current_user.id)
    event.update(event_params)
    redirect_to events_path(current_user)
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path(current_user)
  end

  private
  def event_params
	  params.require(:event).permit(:title, :start, :end, :user_id, :body)
  end
end
