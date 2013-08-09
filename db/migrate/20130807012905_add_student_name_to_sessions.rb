class AddStudentNameToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :student_name, :string
  end
end
