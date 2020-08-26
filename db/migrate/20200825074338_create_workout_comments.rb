class CreateWorkoutComments < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_comments do |t|
      t.string :comment
      t.references :user, foreign_key: true
      t.references :workout, foreign_key: true

      t.timestamps
    end
  end
end
