class TutorSession < ActiveRecord::Base
  attr_accessible :date, :notes, :number_of_hours, :student_id, :tutor_id, :student_name, :time, :first_session
  belongs_to :tutors

	def week
	  self.date.strftime("%W")
	end

	def month
	  self.date.strftime("%y%m")
	end

before_save :add_week

  def add_week
    self.week = self.date.strftime("%W")
  end

end
