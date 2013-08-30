class UserMailer < ActionMailer::Base
  default from: "chris.fahmy@movermtutoring.com"

  def admin_student_registration(student)
  	@student = student
  	mail(:to => "chris.fahmy@movermtutoring.com", :subject => "You registered a new student")
  end

  def student_side_registration(student)
  	@student = student
  	mail(:to => student.email, :subject => "Welcome to Mind Over Matter Tutoring!")
  end

  def admin_tutor_registration(tutor)
  	@tutor = tutor
  	mail(:to => "chris.fahmy@movermtutoring.com", :subject => "You registered a new tutor")
  end

  def tutor_side_registration(tutor)
   	@tutor = tutor
  	mail(:to => tutor.email, :subject => "Welcome to Mind Over Matter Tutoring!")
  end

  def first_session_email(student, tutor, first_session)
  	@student = student
  	@tutor = tutor
  	@first_session = first_session
  	mail(:to => tutor.email, :subject => "New student!")
  end

  def new_contract (student, contract)
  	@student = student
  	@contract = contract
  	mail(:to => student.email, :subject => "New Contract Information")
  end

  def admin_new_contract (student, contract)
  	@student = student
  	@contract = contract
  	mail(:to => "chris.fahmy@movermtutoring.com", :subject => "NEW CONTRACT!")
  end


end
