class Contract < ActiveRecord::Base
  attr_accessible :contract_type, :hours_left, :student_id, :tutor_1_id, :tutor_2_id, :tutor_3_id, :notes, :rate, :status, :payment_information

  belongs_to :student
end
