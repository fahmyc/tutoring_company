class Match < ActiveRecord::Base
  attr_accessible :student_id, :tutor_id

  belongs_to :student
end
