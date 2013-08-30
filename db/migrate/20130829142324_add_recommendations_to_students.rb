class AddRecommendationsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :recommendations, :string
  end
end
