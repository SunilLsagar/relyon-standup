class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references :setup, null: false, foreign_key: true
      t.string :respondents
      t.timestamps
    end
  end
end
