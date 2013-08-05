class AddAdminIdToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :admin_id, :integer
  end
end
