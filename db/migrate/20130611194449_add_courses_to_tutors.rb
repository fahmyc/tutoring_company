class AddCoursesToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :courses, :string
  end
end
