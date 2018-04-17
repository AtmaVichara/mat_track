class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :students, optional: true
end
