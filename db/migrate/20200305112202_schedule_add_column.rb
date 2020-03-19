class ScheduleAddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :day_of_bi_week, :string
    add_column :schedules, :time_of_day ,:time
  end
end
