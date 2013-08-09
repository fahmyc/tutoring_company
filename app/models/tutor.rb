class Tutor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin_id, :name, :grades, :address, :city, :postal_code, :courses, :primary_phone, :secondary_phone, :total_hours_worked, :notes
  # attr_accessible :title, :body

  serialize :courses
  serialize :grades

  belongs_to :admin
  has_many :tutor_sessions

before_save :clear_empty_courses

  def clear_empty_courses
    self.courses.reject!{|x| x==''}
  end
end
