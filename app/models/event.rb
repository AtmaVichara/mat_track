class Event < ApplicationRecord
  belongs_to :lesson
  has_many :attendances
  has_many :users, through: :attendances
end
