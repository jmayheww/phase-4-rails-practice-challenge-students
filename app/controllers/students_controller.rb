class StudentsController < ApplicationController
  wrap_parameters format: []
  def index
    students = Student.all
    render json: students, status: :ok
  end

  def show
    student = found_student
    render json: student, status: :found
  end

  def create
    new_student = Student.create!(student_params)
    render json: new_student, status: :created
  end

  def update
    student = found_student
    student.update!(student_params)
    render json: student, status: :ok
  end

  def destroy
    student = found_student
    student.destroy
    head :no_content
  end

  private

  def found_student
    Student.find(params[:id])
  end

  def student_params
    params.permit(:name, :age, :major, :instructor_id)
  end
end
