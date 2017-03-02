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
    @month = Month.find(params[:month_id])
    @event = Event.new
  end

  #update
  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to month_path(@event)
  end

  def create
  @month = Month.find(params[:month_id])
  @month.events.create!(event_params)
  redirect_to month_path(@month)
  end

  def edit
  @month = Month.find(params[:month_id])
  @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:month_id])
    if @event.user == current_user
      @event.destroy
    else
      flash[:alert] = " You can not delete that!! STOP!"
    end
    # redirect_to root_path
    # @month = Month.find(params[:id])
    # @month.destroy
    redirect_to months_path
    end
  end

    private

    def event_params
      params.require(:event).permit(:name)
    end
