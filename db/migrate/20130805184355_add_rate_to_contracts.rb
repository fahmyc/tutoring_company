class AddRateToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :rate, :decimal
  end
end
