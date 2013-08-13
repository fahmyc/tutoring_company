class ChangeDateTypeInFirstSessions < ActiveRecord::Migration
  def self.up
  	change_column :first_sessions, :date, :date
  end

  def self.down
  	change_column :first_sessions, :date, :string
  end
end
