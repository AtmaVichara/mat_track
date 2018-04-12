class FixNameInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :fist_name, :first_name
  end
end
