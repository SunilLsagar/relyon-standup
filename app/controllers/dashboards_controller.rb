class DashboardsController < ApplicationController

before_action :require_user
before_action :check_session

def index



end

def create
  @setup = Setup.new(setup_params)
  @setup.user_id = session[:user_id]
  @setup.status = '1'
    if @setup.save
      session[:setup_id] = @setup.id
      flash[:success] = "Record added Successfully!"
      redirect_to schedules_path
    else
      render 'new'
    end
end


private

  def setup_params
    params.require(:dashboard).permit(:setup_name, :icon, :purpose)
  end


end
