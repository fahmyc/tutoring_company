class AddSecondaryPhoneToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :secondary_phone, :string
  end
end
