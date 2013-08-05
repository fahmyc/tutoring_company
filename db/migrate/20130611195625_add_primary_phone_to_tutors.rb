class AddPrimaryPhoneToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :primary_phone, :string
  end
end
