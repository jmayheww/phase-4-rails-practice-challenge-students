class InstructorsController < ApplicationController
  def index
    instructors = Instructor.all
    render json: instructors, status: :ok
  end

  def show
    instructor = found_instructor
    render json: instructor, status: :ok
  end

  def create
    instructor = Instructor.create!(instructor_params)
    render json: instructor, status: :created
  end

  def update
    instructor = found_instructor
    instructor.update!(instructor_params)
    render json: instructor, status: :ok
  end

  def destroy
    instructor = found_instructor
    instructor.destroy
    head :no_content
  end

  private

  def instructor_params
    params.permit(:name)
  end

  def found_instructor
    Instructor.find(params[:id])
  end
end
