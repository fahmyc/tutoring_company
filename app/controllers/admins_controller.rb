class AdminsController < ApplicationController
  before_filter :authenticate_admin!
  
  def show
  	@admin = Admin.find(params[:id])

  end

  def new_student
  	@admin = Admin.find(params[:id])
  	@student = current_admin.students.build(params[:student])
  	@courses = ["Grade 1-6 (except French)", "Grade 7 Math","Grade 8 Math", "Grade 9 Math", "Grade 10 Math", "Grade 11 Math", "Grade 12 Math", "Grade 7 Science", "Grade 8 Science", "Grade 9 Science", "Grade 10 Science", "Grade 1-8 French", "Grade 9-12 French", "Grade 1-8 English", "Grade 9-12 English", "Grade 11 Chemistry", "Grade 12 Chemistry", "Grade 11 Biology", "Grade 12 Biology", "Grade 11 Physics", "Grade 12 Physics", "Grade 9-12 Religion", "Grade 9-12 Geography", "Grade 9-12 History", "Grade 9-12 Economics", "Grade 9-12 Business" ]
  	@grades = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  	tutors = Tutor.all
  	@tutor_names = tutors.collect(&:name)
  end
 
  def new_tutor
  	@admin = Admin.find(params[:id])
  	@tutor = current_admin.tutors.build(params[:tutor])
  	@courses = ["Grade 1-6 (except French)", "Grade 7 Math","Grade 8 Math", "Grade 9 Math", "Grade 10 Math", "Grade 11 Math", "Grade 12 Math", "Grade 7 Science", "Grade 8 Science", "Grade 9 Science", "Grade 10 Science", "Grade 1-8 French", "Grade 9-12 French", "Grade 1-8 English", "Grade 9-12 English", "Grade 11 Chemistry", "Grade 12 Chemistry", "Grade 11 Biology", "Grade 12 Biology", "Grade 11 Physics", "Grade 12 Physics", "Grade 9-12 Religion", "Grade 9-12 Geography", "Grade 9-12 History", "Grade 9-12 Economics", "Grade 9-12 Business" ]
  end


end
