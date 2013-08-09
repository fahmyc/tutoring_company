class CreateFirstSessions < ActiveRecord::Migration
  def change
    create_table :first_sessions do |t|
      t.integer :tutor_id
      t.integer :student_id
      t.string :date
      t.string :result_of_first_session
      t.text :notes

      t.timestamps
    end
  end
end
