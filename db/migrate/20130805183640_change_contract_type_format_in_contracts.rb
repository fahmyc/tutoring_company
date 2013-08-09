class ChangeContractTypeFormatInContracts < ActiveRecord::Migration
  def up
  	change_column :contracts, :contract_type, :string
  end

  def down
  	change_column :contracts, :contract_type, :integer
  end
end
