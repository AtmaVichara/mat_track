class CreateSchoolLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :school_lessons do |t|
      t.references :school, foreign_key: true
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
