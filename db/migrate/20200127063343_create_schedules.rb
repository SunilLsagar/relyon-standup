class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :setup, null: false, foreign_key: true
      t.string :frequency
      t.string :day_of_week
      t.string :day_of_month
      t.string :reminder
      t.timestamps
    end
  end
end
