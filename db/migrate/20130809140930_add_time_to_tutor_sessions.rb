class AddTimeToTutorSessions < ActiveRecord::Migration
  def change
    add_column :tutor_sessions, :time, :string
  end
end
