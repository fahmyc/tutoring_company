class AddRecommendedByStudentToStudents < ActiveRecord::Migration
  def change
    add_column :students, :recommended_by_student, :string
  end
end
