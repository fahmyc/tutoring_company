class RemoveSubjectsFromTutors < ActiveRecord::Migration
  def up
    remove_column :tutors, :subjects
  end

  def down
    add_column :tutors, :subjects, :string
  end
end
