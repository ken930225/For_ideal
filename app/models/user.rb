class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workouts
  has_many :favorites, dependent: :destroy
  has_many :workout_comments, dependent: :destroy
  has_many :events
  attachment :profile_image, destroy: false
  validates :introduction, length: { maximum: 50 }
end
