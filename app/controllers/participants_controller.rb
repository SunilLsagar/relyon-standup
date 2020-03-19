class ParticipantsController < ApplicationController
  before_action :require_user
  before_action :check_session
  before_action :check_setup

  def index

  end

  def create

    @setup_id=session[:setup_id]
    if @setup_id.present?
      @data = Participant.new(participants_params)
      @data.setup_id = @setup_id
        if @data.save
          flash[:success] = "Record added Successfully!"
          redirect_to view_infos_path
        else
          render 'new'
        end
    else
      redirect_to dashboards_path
    end

  end


  private

  def participants_params
    params.require(:builder).permit(:respondents)
  end

end
