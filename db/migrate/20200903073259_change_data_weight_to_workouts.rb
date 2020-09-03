class ChangeDataWeightToWorkouts < ActiveRecord::Migration[5.2]
  def change
  	change_column :workouts, :weight, :string
  end
end
