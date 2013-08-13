class AddFirstSessionToTutorSessions < ActiveRecord::Migration
  def change
    add_column :tutor_sessions, :first_session, :boolean
  end
end
