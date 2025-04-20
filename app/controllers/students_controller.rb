class StudentsController < ApplicationController
  before_action :set_student,only: [:show,:edit,:update,:destroy]
  def index
    @students = Student.all
  end
  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
  end

  def edit
  end

  def update
  end

  def destroy
    @student.destroy
  end


  private

  def student_params
    params.require(:student).permit(:name,:cpf,:gender,:payment_method,:cellphone,:date_of_birth)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end