class Api::V1::StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def enroll_student
    student = Student.new(user_params)
    if student.save 
      render json: {message: "Student added successfully"}, status: :created
    else
      render json: {errors: student.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def enroll_subject
    student = Student.find_by(id: params[:student_id])
    subject = Subject.find_by(id: params[:subject_id])
    if student && subject
      student.subjects << subject
      render json: {message: "Student enrolled in subject successfully"}, status: :ok
    else
      render json: {errors: "Some error occured"}, status: :bad_request
    end
  end

  def register_exam
    student = Student.find_by(id: params[:student_id])
    exam = Exam.find_by(id: params[:exam_id])
    if student && exam
      registration = Registration.new(student: student, exam: exam)
      if registration.valid?
        if registration.save
          render json: {message: "Student registered for exam successfully"}, status: :ok
        else
          render json: {errors: "Some error occured"}, status: :bad_request
        end
      else
        render json: {errors: "Student is not enrolled for the respective subject"}, status: :bad_request
      end
    else
      render json: {errors: "Some error occured"}, status: :bad_request
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
