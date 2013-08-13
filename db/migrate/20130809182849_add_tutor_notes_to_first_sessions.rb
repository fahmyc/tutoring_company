class AddTutorNotesToFirstSessions < ActiveRecord::Migration
  def change
    add_column :first_sessions, :tutor_notes, :text
  end
end
