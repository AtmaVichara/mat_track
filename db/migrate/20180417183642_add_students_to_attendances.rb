class AddStudentsToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_reference :attendances, :student, foreign_key: true
  end
end
