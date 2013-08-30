class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :parent_name, :student_name, :gender, :primary_phone, :secondary_phone, :address, :city, :grade, :school, :how_they_heard, :tutor_assigned, :number_of_contracts, :number_of_one_time_sessions, :notes, :admin_id, :courses, :recommended_by_student, :recommended_by_other, :recommendations
  # attr_accessible :title, :body
	
	serialize :courses
  serialize :recommendations

  has_many :contracts
  has_many :first_sessions
  has_many :matchs

  belongs_to :admin

before_save :clear_empty_courses

  def clear_empty_courses
    self.courses.reject!{|x| x==''}
  end
  
end

