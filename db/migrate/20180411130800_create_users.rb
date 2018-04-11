class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fist_name
      t.string :last_name
      t.string :token
      t.string :refresh_token
      t.string :expires_at
      t.string :email
      t.string :password_digest
      t.integer :role
      t.string :uid
      t.string :provider

      t.timestamps
    end
  end
end
