class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :student_id
      t.integer :contract_type
      t.integer :hours_left
      t.integer :tutor_1_id
      t.integer :tutor_2_id
      t.integer :tutor_3_id

      t.timestamps
    end
  end
end
