class EnrollmentsController < ApplicationController
  before_action :set_enrollment,only: [:show,:edit,:update,:destroy]
  def index
    @enrollments = Enrollment.all
  end
  def show
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
  end

  def edit
  end

  def update
  end

  def destroy
    @enrollment.destroy
  end


  private

  def enrollment_params
    params.require(:enrollment).permit(:total_value,:invoice_quantity,:due_day,:course_name,:university,:student)
  end

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end
end