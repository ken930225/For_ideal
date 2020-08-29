class User < ApplicationRecord
<<<<<<< HEAD
=======
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workouts
  has_many :favorites, dependent: :destroy
  has_many :workout_comments, dependent: :destroy
>>>>>>> 19cc48fb1bcad4429eb1697eab218d40dcef60d7
end
