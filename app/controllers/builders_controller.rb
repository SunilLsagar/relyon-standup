class BuildersController < ApplicationController
  before_action :require_user
  before_action :check_session
  before_action :check_setup
  def index



  end

  def create
    @setup_id=session[:setup_id]
    if @setup_id.present?
      @builder = Builder.new(setup_params)
      @builder.setup_id = @setup_id
        if @builder.save
          flash[:success] = "Record added Successfully!"
          redirect_to participants_path
        else
          render 'new'
        end
    else
      redirect_to dashboards_path
    end


  end

  def new

  end

  private

  def setup_params
    params.require(:builder).permit(:answer1, :answer2, :answer3, :kudos, :suggestions)
  end


end
