class CreateSetups < ActiveRecord::Migration[5.2]
  def change
    create_table :setups do |t|
      t.references :user, null: false, foreign_key: true
      t.string :setup_name
      t.string :icon
      t.string :purpose
      t.string :status
      t.timestamps
    end
  end
end
