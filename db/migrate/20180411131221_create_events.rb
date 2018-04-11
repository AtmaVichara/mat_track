class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :date
      t.references :lesson, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
