class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.string :place
      t.string :target
      t.string :menu
      t.integer :count
      t.integer :weight

      t.timestamps
    end
  end
end
