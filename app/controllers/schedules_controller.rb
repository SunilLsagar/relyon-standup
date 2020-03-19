class SchedulesController < ApplicationController
before_action :require_user
before_action :check_session
before_action :check_setup

def index

end

def create
  @sch = Schedule.new(setup_params)
  @sch.setup_id = session[:setup_id]
  @sch.day_of_week=params[:day_of_week];
  @sch.day_of_bi_week=params[:day_of_bi_week];
  @sch.reminder=params[:reminder];
    if @sch.save
      flash[:success] = "Record added Successfully!"
      redirect_to builders_path
    else
      render 'new'
    end

end


private

  def setup_params
    params.require(:schedule).permit(:frequency, :day_of_month, :time_of_day)
  end

end
