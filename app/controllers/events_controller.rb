class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    if @event = Event.create(event_params)
      flash[:success] = "Event created!"
      redirect_to events_path
    else
      flash[:alert] = "Failed to create event!"
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:success] = "Event updated!"
      redirect_to events_path
    end
      flash[:alert] = "Update failed!"
      render :edit
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:image, :title)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
