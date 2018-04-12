class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :street
      t.string :state
      t.string :zip
      t.string :name

      t.timestamps
    end
  end
end
