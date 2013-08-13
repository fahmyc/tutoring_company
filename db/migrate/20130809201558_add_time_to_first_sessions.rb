class AddTimeToFirstSessions < ActiveRecord::Migration
  def change
    add_column :first_sessions, :time, :string
  end
end
