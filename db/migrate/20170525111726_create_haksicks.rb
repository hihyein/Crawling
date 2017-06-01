class CreateHaksicks < ActiveRecord::Migration[5.0]
  def change
    create_table :haksicks do |t|
      t.string :day
      t.string :date
      t.string :lunch_a
      t.string :lunch_b
      t.string :dinner
      t.timestamps
    end
  end
end
