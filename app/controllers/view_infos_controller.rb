class ViewInfosController < ApplicationController

  def index
    @data=Setup.select('setups.id,setups.setup_name,setups.icon,setups.purpose,schedules.frequency,schedules.day_of_week,schedules.day_of_month,schedules.day_of_bi_week,builders.answer1,builders.answer2,builders.answer3,builders.kudos,builders.suggestions,participants.respondents').joins(:schedule, :builder ,:participant)

  end

  def destroy
    @setup=Setup.find(params[:id])
    @setup.destroy
    redirect_to view_infos_path

  end

end
