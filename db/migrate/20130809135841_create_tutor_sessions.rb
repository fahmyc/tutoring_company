class CreateTutorSessions < ActiveRecord::Migration
  def change
    create_table :tutor_sessions do |t|
      t.integer :student_id
      t.integer :tutor_id
      t.date :date
      t.decimal :number_of_hours
      t.text :notes

      t.timestamps
    end
  end
end
