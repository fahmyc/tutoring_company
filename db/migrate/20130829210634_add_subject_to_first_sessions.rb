class AddSubjectToFirstSessions < ActiveRecord::Migration
  def change
    add_column :first_sessions, :subject, :string
  end
end
