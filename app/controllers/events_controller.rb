class EventsController < ApplicationController


  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @month = Month.find(params[:month_id])
    @event = Event.new
  end

  def update
    @event = Event.find(params[:id])
    # an enhancement would be to use .save with a conditional for error handling, in case of invalid data being entered on the form
    @event.update(event_params)
    redirect_to month_path(@event)
  end

  def create
    @month = Month.find(params[:month_id])
    # would remove ! from create-- the reason is that you don't want your program to throw a fatal exception and break. use ! on ActiveRecord methods in your seed file
    @month.events.create!(event_params)
    redirect_to month_path(@month)
  end

  def edit
    @month = Month.find(params[:month_id])
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:month_id])
    # nice error handling!
    if @event.user == current_user
      @event.destroy
    else
      # Maybe change the flash alert to "Only the user who created this event can delete it."
      flash[:alert] = " You can not delete that!! STOP!"
    end

    ## remove commented out code

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
