class Lesson < ApplicationRecord
  has_many :events
  has_many :school_lessons
  has_many :schools, through: :school_lessons
  has_many :attendances, through: :events

  def self.users_lessons(user_id)
    joins(schools: :user_schools)
      .group(:id)
      .where('user_schools.user_id = ?', user_id)
  end
end
