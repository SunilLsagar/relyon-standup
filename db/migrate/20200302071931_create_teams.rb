class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.references :user, null: false, foreign_key: true
      t.string :team_name
      t.timestamps
    end
  end
end
