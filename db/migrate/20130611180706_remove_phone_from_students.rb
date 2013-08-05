class RemovePhoneFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :phone
  end

  def down
    add_column :students, :phone, :string
  end
end
