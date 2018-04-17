class School < ApplicationRecord
  has_many :school_lessons
  has_many :lessons, through: :school_lessons
  has_many :user_schools
  has_many :users, through: :user_schools
  has_many :students, through: :user_schools
end
