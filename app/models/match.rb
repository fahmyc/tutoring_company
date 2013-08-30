class Match < ActiveRecord::Base
  attr_accessible :student_id, :tutor_id, :wage

  belongs_to :student
end
