class MonthsController < ApplicationController

def index
  @months = Month.all
 end

 def show
  @month = Month.find(params[:id])
end

def new
  redirect_to root_path
  @month = Month.new
end

def update
  @month = Month.find(params[:id])
  @month.update(month_params)
  redirect_to month_path(@month)
end

def create
  redirect_to root_path(@month)
  @month = Month.create!(month_params)
end

def edit
  @month = Month.find(params[:id])
end

def destroy
  redirect_to root_path
  @month = Month.find(params[:id])
  @month.destroy
  redirect_to month_path
end

  private

  def month_params
    params.require(:month).permit(:name)
  end

end
