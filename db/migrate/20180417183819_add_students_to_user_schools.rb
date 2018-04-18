class AddStudentsToUserSchools < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_schools, :student, foreign_key: true
  end
end
