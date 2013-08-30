class AddWageToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :wage, :decimal
  end
end
