class CreateUserSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :user_schools do |t|
      t.references :user, foreign_key: true
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
