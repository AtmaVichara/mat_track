class UserSchool < ApplicationRecord
  belongs_to :user
  belongs_to :school
  belongs_to :students, optional: true
end
