class CreateUserStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :user_students do |t|
      t.references :student, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
