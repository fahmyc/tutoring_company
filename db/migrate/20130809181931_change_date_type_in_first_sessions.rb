class ChangeDateTypeInFirstSessions < ActiveRecord::Migration
  def self.up
  connection.execute(%q{
    alter table first_sessions
    alter column date
    type date using cast(date as date)
  })
end

  #	change_column :first_sessions, :date, :date
  #end

  def self.down
  	change_column :first_sessions, :date, :string
  end
end
