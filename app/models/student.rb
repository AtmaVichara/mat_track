class Student < ApplicationRecord
  has_many :user_students
  has_many :users, through: :user_students
  has_many :attendances
  has_many :events, through: :attendances
  has_many :user_schools
  has_many :schools, through: :user_schools
  has_many :grades

end
