Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "students/enroll" => "students#enroll_student"
      put "students/:student_id/enroll_subject/:subject_id" => "students#enroll_subject"
      post "subjects/create" => "subjects#create_subject"
      post "exams/create" => "exams#create_exam"
      put "students/:student_id/register_exam/:exam_id" => "students#register_exam"
    end
  end
end
