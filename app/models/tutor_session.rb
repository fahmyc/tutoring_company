class TutorSession < ActiveRecord::Base
  attr_accessible :date, :notes, :number_of_hours, :student_id, :tutor_id, :student_name, :time
  belongs_to :tutors
end
