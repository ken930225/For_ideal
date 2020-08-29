class AddDateToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :date, :string
  end
end
