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
    @event = Event.new

  end

  #update
  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to month_path(@event)
  end

  def create
  @event = Event.create!(event_params)
    # @event = Event.find(params[:month_id])
  redirect_to @event.month
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    redirect_to root_path
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to @event.month
  end

    private

    def event_params
      params.require(:event).permit(:name)
    end

end
