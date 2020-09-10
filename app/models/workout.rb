class Workout < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :workout_comments, dependent: :destroy

  validates :date, presence: true
  validates :place, presence: true
  validates :menu, presence: true
  validates :target, presence: true
  validates :weight, presence: true
  validates :count, presence: true
  validates :set, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
