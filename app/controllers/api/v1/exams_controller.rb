class Api::V1::ExamsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create_exam
    exam = Exam.new(exam_params)
    if exam.save
      render json: {message: "Exam added successfully"}, status: :created
    else
      render json: {errors: exam.errors.full_messages}, status: :unprocessable_entity
    end
  end
  private
  def exam_params
    params.require(:exam).permit(:subject_id)
  end
end
