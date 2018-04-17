class AddAttributesToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :status, :string
    add_column :events, :creator, :string
    add_column :events, :organizer, :string
    add_column :events, :start, :string
    add_column :events, :end, :string
    add_column :events, :google_id, :string
    add_column :events, :description, :text
  end
end
