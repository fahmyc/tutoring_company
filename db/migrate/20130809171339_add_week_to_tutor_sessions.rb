class AddWeekToTutorSessions < ActiveRecord::Migration
  def change
    add_column :tutor_sessions, :week, :integer
  end
end
