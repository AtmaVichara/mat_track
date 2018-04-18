class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.text :notes
      t.references :student, foreign_key: true
      t.string :grade

      t.timestamps
    end
  end
end
