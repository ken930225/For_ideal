class AddSetToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :set, :integer
  end
end
