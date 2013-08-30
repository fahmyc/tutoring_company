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
  end
 
  def new_tutor
  	@admin = Admin.find(params[:id])
  	@tutor = current_admin.tutors.build(params[:tutor])
  	@courses = ["Grade 1-6 (except French)", "Grade 7 Math","Grade 8 Math", "Grade 9 Math", "Grade 10 Math", "Grade 11 Math", "Grade 12 Math", "Grade 7 Science", "Grade 8 Science", "Grade 9 Science", "Grade 10 Science", "Grade 1-8 French", "Grade 9-12 French", "Grade 1-8 English", "Grade 9-12 English", "Grade 11 Chemistry", "Grade 12 Chemistry", "Grade 11 Biology", "Grade 12 Biology", "Grade 11 Physics", "Grade 12 Physics", "Grade 9-12 Religion", "Grade 9-12 Geography", "Grade 9-12 History", "Grade 9-12 Economics", "Grade 9-12 Business" ]
  end

  def admin_student_profile
    @student = Student.find(params[:student_id])
    @contracts = Contract.find(:all, :conditions => { :student_id => params[:student_id] })

    @first_session = FirstSession.find(:all, :conditions => { :student_id => params[:student_id] })
  end

  def edit_recommendations
    @student = Student.find(params[:student_id])

    @all_students = Student.all
    @all_students_names = @all_students.collect(&:student_name)
  end

  def recommended_by_student
    @student = Student.find(params[:student_id])
    @student_that_recommended = Student.find(params[:student_id2])

    @student.update_attributes(recommended_by_student: @student_that_recommended.id)
    redirect_to edit_recommendations_path(current_admin, @student)

    @student_recommendations = []
    if !@student_that_recommended.recommendations.nil?
      @student_recommendations = @student_recommendations.push(@student_that_recommended.recommendations)
      @new_student_recommendations = @student_recommendations.push(@student.student_name)
      @student_that_recommended.update_attributes(recommendations: @new_student_recommendations)
    else
      @new_student_recommendations = @student_recommendations.push(@student.student_name)
      @student_that_recommended.update_attributes(recommendations: @new_student_recommendations)
    end

   # other_recommendation = params[:student][:recommended_by_other]

#    if !other_recommendation.nil?
 #     @student.update_attributes(recommended_by_other: other_recommendation)
  #    redirect_to edit_recommendations_path(current_admin, @student)
   # end

  end
end
