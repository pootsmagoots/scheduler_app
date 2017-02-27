class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  #show
  def show
    @event = Event.find(params[:id])
  end

  #new
  def new
    redirect_to root_path
    @event = Event.new
  end

  #update
  def update
    @event = Event.find(params[:id])
    @event.update(house_params)
    redirect_to houses_path(@event)
  end

  def create
    redirect_to root_path(@event)
    @event = Event.create!(house_params)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    redirect_to root_path
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to houses_path
  end

    private

    def event_params
      params.require(:character).permit(:name)
    end

end
