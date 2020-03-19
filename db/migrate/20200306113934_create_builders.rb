class CreateBuilders < ActiveRecord::Migration[5.2]
  def change
    create_table :builders do |t|
      t.references :setup, null: false, foreign_key: true
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.string :kudos
      t.string :suggestions
      t.timestamps
    end
  end
end
