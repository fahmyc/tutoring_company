class RemoveSubjectFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :subject
  end

  def down
    add_column :students, :subject, :string
  end
end
