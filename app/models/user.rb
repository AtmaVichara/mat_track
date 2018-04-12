class User < ApplicationRecord
  has_many :user_schools
  has_many :schools, through: :user_schools
  has_many :attendances
  has_many :events, through: :attendances
  has_secure_password
end
