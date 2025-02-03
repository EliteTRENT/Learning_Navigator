class Api::V1::SubjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create_subject
    subject = Subject.new(subject_params)
    if subject.save
      render json: {message: "Subject added successfully"}, status: :created
    else
      render json: {errors: subject.errors.full_messages}, status: :unprocessable_entity
    end
  end
  private
  def subject_params
    params.require(:subject).permit(:name)
  end
end
