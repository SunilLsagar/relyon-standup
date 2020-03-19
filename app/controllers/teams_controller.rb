class TeamsController < ApplicationController

    def index
      @teams = Team.paginate(page: params[:page], per_page: 100)
      @team = Team.new
    end

    def new

    end

    def create
      @team = Team.new(setup_params)
      @team.user_id = session[:user_id]
        if @team.save
          session[:team_id] = @team.id
          flash[:success] = "Record added Successfully!"
          redirect_to teams_path
        else
          render 'index'
        end
    end

    def destroy
      @team=Team.find(params[:id])
      @team.destroy
      redirect_to teams_path

    end

    def edit
      @editTeam = Team.find(params[:id])

    end

    def update
      @team=Team.find(params[:id])
      @team.update(params.require(:team).permit(:team_name))
      redirect_to teams_path

    end

    def show
      session[:team_id]=params[:id]
      @showTeam = Team.find(params[:id])
      @team = TeamMember.new
      @team_members=TeamMember.where(team_id: params[:id])

    end

    def team_ajax
      @teams=Team.all
      respond_to do |format|
        format.json { render json: @teams}
      end
    end


  private

    def setup_params
      params.require(:team).permit(:team_name)
    end


end
