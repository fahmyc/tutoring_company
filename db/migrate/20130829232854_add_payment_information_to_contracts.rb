class AddPaymentInformationToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :payment_information, :text
  end
end
