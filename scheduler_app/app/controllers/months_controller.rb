class MonthsController < ApplicationController

def index
  @months = Month.all
 end

 def show
  @month = Month.find(params[:id])

end

def new
  @month = Month.new
end

def update
  @month = Month.find(params[:id])
  @month.update(month_params)
  redirect_to month_path(@month)
end

def create
  @month = current_user.months.create!(month_params)
  redirect_to root_path(@month)
  # @month = Month.create!(month_params)
end

def edit
  @month = Month.find(params[:id])
  if @month.user == current_user
    @month.destroy
  else
    flash[:alert] = "You can not edit that!! STOP!"
  end
  redirect_to months_path
end

def destroy
  @month = Month.find(params[:id])
  if @month.user == current_user
    @month.destroy
  else
    flash[:alert] = " You can not delete that!! STOP!"
  end
  # redirect_to root_path
  # @month = Month.find(params[:id])
  # @month.destroy
  redirect_to months_path
end

  private

  def month_params
    params.require(:month).permit(:name)
  end

end
