class School < ApplicationRecord
  has_many :school_lessons, dependent: :destroy
  has_many :lessons, through: :school_lessons
  has_many :user_schools, dependent: :destroy
  has_many :users, through: :user_schools
  has_many :students, through: :user_schools
end
