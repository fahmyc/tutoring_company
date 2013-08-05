class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :parent_name, :student_name, :gender, :primary_phone, :secondary_phone, :address, :city, :grade, :school, :how_they_heard, :tutor_assigned, :number_of_contracts, :number_of_one_time_sessions, :notes, :admin_id, :courses
  # attr_accessible :title, :body
	
	serialize :courses

  belongs_to :admin

before_save :clear_empty_courses

  def clear_empty_courses
    self.courses.reject!{|x| x==''}
  end
  
end

