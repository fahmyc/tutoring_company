class AddStudentNameToTutorSessions < ActiveRecord::Migration
  def change
    add_column :tutor_sessions, :student_name, :string
  end
end
