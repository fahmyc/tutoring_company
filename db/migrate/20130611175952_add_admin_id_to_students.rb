class AddAdminIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :admin_id, :integer
  end
end
