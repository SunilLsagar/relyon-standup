class TeamMembersController < ApplicationController

  def index


  end

  def create

     @team = TeamMember.new(setup_params)
      @team.user_id = session[:user_id]
      @team.team_id = session[:team_id]
      @team.team_name = session[:team_name]
        if @team.save
          flash[:success] = "Record added Successfully!"
          redirect_to "/teams/#{session[:team_id]}"
        else
          redirect_to teams_path
        end

  end

  def destroy

    @team=TeamMember.find(params[:id])
    @team.destroy
    redirect_to "/teams/#{session[:team_id]}"

  end

  private

   def setup_params
      params.require(:team_member).permit(:user_name)
    end

end
