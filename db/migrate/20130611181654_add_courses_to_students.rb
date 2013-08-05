class AddCoursesToStudents < ActiveRecord::Migration
  def change
    add_column :students, :courses, :string
  end
end
