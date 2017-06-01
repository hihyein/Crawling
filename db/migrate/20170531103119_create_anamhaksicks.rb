class CreateAnamhaksicks < ActiveRecord::Migration[5.0]
  def change
    create_table :anamhaksicks do |t|
      t.string :day
      t.string :date
      t.string :breakfast
      t.string :breakfast_a
      t.string :breakfast_b
      t.string :lunch
      t.string :dinner

      t.timestamps
    end
  end
end
