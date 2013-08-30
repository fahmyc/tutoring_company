class AddRecommendedByOtherToStudents < ActiveRecord::Migration
  def change
    add_column :students, :recommended_by_other, :string
  end
end
