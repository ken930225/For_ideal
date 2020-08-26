class Workout < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :workout_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
