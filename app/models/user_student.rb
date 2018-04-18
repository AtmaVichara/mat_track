class UserStudent < ApplicationRecord
  belongs_to :student
  belongs_to :user
end
