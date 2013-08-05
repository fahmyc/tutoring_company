class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :student_id
      t.string :tutor_id
      t.string :date
      t.integer :number_of_hours
      t.boolean :first_time_session
      t.text :notes

      t.timestamps
    end
  end
end
