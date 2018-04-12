class SchoolLesson < ApplicationRecord
  belongs_to :school
  belongs_to :lesson
end
