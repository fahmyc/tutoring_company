class Session < ActiveRecord::Base
  attr_accessible :date, :first_time_session, :notes, :number_of_hours, :student_id, :tutor_id
end
