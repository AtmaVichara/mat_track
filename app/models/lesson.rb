class Lesson < ApplicationRecord
  has_many :events
  has_many :school_lessons
  has_many :schools, through: :school_lessons
end
