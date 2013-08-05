class ChangeIntegerFormatInTutors < ActiveRecord::Migration
  def self.up
  	change_column :tutors, :grades, :string
  end

  def self.down
  	change_column :tutors, :grades, :integer
  end
end
