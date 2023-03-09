class StudentsController < ApplicationController
  def index
    students = Student.all
    render json: students, status: :ok
  end

  def show
    student = found_student
    render json: student, status: :found
  end

  def create
    render json: Student.create!(student_params), status: :created
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
