class ChangeHoursLeftFormatInContracts < ActiveRecord::Migration
  def up
  	change_column :contracts, :hours_left, :decimal
  end

  def down
  	change_column :contracts, :hours_left, :integer
  end
end
